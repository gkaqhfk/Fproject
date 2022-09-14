package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor(staticName = "of")
@ToString
public class UserRequest {

    private String username;
    private String password;

}
