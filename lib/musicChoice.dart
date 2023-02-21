/* Nadia Morrow
 * Mobile Development
 * Last Updated: 12/1/22
 * This page creates class to notify other pages of changes in music choice
 */
import 'package:flutter/material.dart';
import 'package:stmu_mentalsource/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MusicChoice with ChangeNotifier{
  int musicChoice = 1;
  bool mode = false;
  //late int textsize;

  MusicChoice() {
    loadSettings();
  }

  ThemeData get themeData => mode ? ThemeData.dark() : ThemeData.light().copyWith(
      primaryColor: Colors.brown,
      appBarTheme: AppBarTheme(backgroundColor: Colors.brown, foregroundColor: Colors.white, actionsIconTheme: IconThemeData(color: Colors.tealAccent),),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.teal,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.teal,
              backgroundColor: Colors.brown))
      );
  bool get inDarkMode => mode;

  void toggleTheme(){
    mode = !mode;
    notifyListeners();
  }

  int getMusicChoice (){
    return musicChoice;
}

  void setMusicChoice (int i) {
    musicChoice = i;
    notifyListeners();
  }

  bool getMode (){
    return mode;
  }

  void setMode (bool m){
    mode = m;
  }

  void saveSettings (context) async{
    final user = supabase.auth.currentUser;
    final updates = {
      'uiid': user!.id,
      'mode': mode,
      'music': musicChoice,
      'textsize': 0
    };
    try {
      await supabase.from('settings').upsert(updates);
      if (context.mounted) {
        ///context.showSnackBar(message: 'Successfully saved settings!');
        const SnackBar(content: Text('Successfully saved settings!'),);
      }
    } on PostgrestException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      const SnackBar(content: Text('Unexpected exception occurred'),);
  }}

  Future<void> loadSettings () async {
    try {
      final userId = supabase.auth.currentUser!.id;
      final data = await supabase
          .from('settings')
          .select()
          .eq('uiid', userId)
          .single() as Map;
      mode = (data['mode'] ?? '') as bool;
      musicChoice = (data['music'] ?? '') as int;
      //textsize = (data['textsize'] ?? '') as int;
    } on PostgrestException catch (error) {
      mode = false;
      musicChoice = 1;
      //textsize = 1;
    } catch (error) {
      mode = false;
      musicChoice = 1;
      SnackBar(content: const Text('Unexpected exception occurred'),);
    }

  }

}