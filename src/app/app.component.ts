import { Component } from '@angular/core';
import { TemasService } from './temas.service';
import { environment as ENV } from "@env/environment";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = ENV.APP_NAME;
  // title = 'MI APP';
  data$ = this.temasService.cargarTemas();
  constructor(private  temasService:TemasService){
    // this.temasService.cargarTemas().subscribe(data => console.log(data));
  }
}
