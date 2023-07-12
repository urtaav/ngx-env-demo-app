import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment as ENV } from "@env/environment";
import { Observable } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class TemasService {
  constructor(private http: HttpClient) { }


  cargarTemas():Observable<any>{
      // return this.http.post('http://172.20.32.220:8090/api/bigdata/catalogo/consultaTematicas', {})
      return this.http.get(ENV.API_TEMAS)
  }

}
