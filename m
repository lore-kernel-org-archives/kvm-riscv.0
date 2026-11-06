Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A49606A33B
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e66rL75r;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEiZixi8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w2L1ZTMLeVf2xA/vfB18zfxA00x+Ee2HShlyPT7JmU4=; b=e66rL75raH2T1VdEO6h0UxVlkp
	7Z5F4R9LNSspRp9XlHKRS7/DrNR/puErV5FqHrpWzUA2Pqy0PJ6/QtCqFw1QG8BzwOouOqV/W9JJo
	j5+adOLf7LFgiy+NMWpFU3iW/y1vAFR+J40b8rblgYd7UDB9MSwp30lq87g1jLyQwGEWXqbvdprwf
	vuExes3zNiLdBcM4/cI8oIbKpKfzubpk2jmJmcACHifqg2ykPl7HbII0XN4fLka7F7JEYWa/aMYKv
	fw10nHenTBXqPEvTKgExteI5uvSJ96RcVxkhHsYQan+nOUdv3khsen8/a22OZsixiF56gWCTtySPC
	lhSutYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGaK-0000000BoK7-36Pd;
	Fri, 06 Nov 2026 09:50:12 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGaH-0000000BoGo-2gGX
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 09:50:11 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so383230e87.3
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Nov 2026 01:50:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793958603; cv=none;
        d=google.com; s=arc-20260327;
        b=pdDJN7gRaVynY6UzrlcZYQ04Dc5HbeT6fvLJcNY8RbWO8qWk2pWur5S9+he4UBT8jm
         CcDNDIxfipNfx1+8P6Q60frhMA/7JiJdkTd2K2AgEsnIkDtkcMZoI5TIMKRUeBkA7G9n
         AjX+FqIf4qLVuAkwETSElrUDCmhr86BdZk1yXNqzILwivty2rLg8wak9AVfwHp7q/QAE
         /hjqEdMgqYbyU4HAM72FFyHYLC081ojGQvv2fVTPoHjAzkDqJHfTuVhx5hZpo0MiVFQ1
         SMUHiR77q0sHpYBKx9NqTDFCK44sxhEPbjvq28KZy5aE6D8gUFVg25SRvwO10Z0Rbi9r
         0htg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i0RXhXRHqPQplgUbaoUrvnlIZ5UbVQs/4MlB5+exT+o=;
        fh=Y+izkGXGKkQul6IPKd3iEB0u4l9cQJuaRaW/Sjmmqn4=;
        b=DWI01A7WChNaQNiitfXvjl4nK77Lq4heonjcm/dWo19Ez9YObKkBvs7OCMSch8Ji+c
         0/0ipwX9egA28Q60p7gEr6BhadAgkl7bf/N2PIDY/bL7K8I5no7V953Bjky3LeD02MVR
         nUm1fQiuG25cpmjbXlskE7t3qofBMbflFkm/Cq4Z8lKRCyoqwhX8bl/qw8P2cbsYIPiq
         QdO+HuyOWuxG40ICMBLK4jDm7Qhsr+MgyUCeBXeUOE3lYIDP2cFi1Cdic5J7KDNN5BMN
         5H6axOo3TS5UViRMKms/vnTzbz5tfp+3JLX/N2+W3oR4dTC0A/UdK8j3KIBXLIvTqQyL
         mL8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958603; x=1794563403; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0RXhXRHqPQplgUbaoUrvnlIZ5UbVQs/4MlB5+exT+o=;
        b=KEiZixi86ODVCLkWakWZUtLHpmlIDlMjzgqn4YsZVpmRaXvis0thOjQIMF2Valyp6b
         MNt3UZuuZHhoc0kWRz14nxZBarZ0Ty0YxfaJVbYaZjpwE0XyRbbNjMBm6Td+DKD1Ay4G
         ELB0FZr0Ke3jhT2SfSvKRx/6euKul9ycQlXbam9G/kqB91/v8DgmvUEZS/SUTnD/mrsC
         aeFoUGAQ7IUhEADNHBbsja0C10C/Brh2uKwxK0i6iRt2/n0Yaveubyx9hfBwJDx+nIjE
         tbKsjbq8rsMEn6I9Lga+KDKFVKPmVtXat/yzL71IvanJSkJJy02pqVbcfH1bWWygLX+O
         JupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958603; x=1794563403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0RXhXRHqPQplgUbaoUrvnlIZ5UbVQs/4MlB5+exT+o=;
        b=SVSlxKe+BD9CJZZA3PqEM73q0Hvp2ZHibU3cnCahT3JwoiEzt2U1NvJ4GZz0nvf2Ak
         FcJic2y2sUaHdyO2cF78mB5B/ydO+BTeP7yM7ypmWqUQEslJAn30jOPdBLUSkGbhpzd5
         DWIPaYlF1LTb1Nr/xVuHZoFNzt5b/G1H0VYyujji9UUjP6BWzghWCjiSqjFfs5bLbvxN
         GmT89hxG2g+FVti1cbPkbG6paPc74VjRdU6e6h1og7oN2k1AR6GCrS1raNbNI7Wzw25e
         VTjBg0MvizuZkV+3ZBztvtLFw5gxZEnS2XAhOor3gJnxL20cYM98lUINW7OlTwfrGXKR
         0ySQ==
X-Forwarded-Encrypted: i=1; AKwUvByH8yoomFY2ZmcI1IG3mKAt2PHhn6PBn/x0y4YxHAdyuUSd15yjWxeA9JlYXO/IS0oEaMNM4WEK6ok=@lists.infradead.org
X-Gm-Message-State: APuU4Z86lYJrWpruGoDrslysG3JTNn8WyLyts96zfbpRS4s3ZSuKM9wU
	XgYzEWhYYsqNzzCNxcPYCijgKIVo0AeDSmQ8rTsCXWBNKX8n/KQ3JYzGsLraNYTUqv96YWFpLUm
	T+dzBeGvw7N65Ku0cBzfhk7weulvWy5Y=
X-Gm-Gg: AYBFou1qwF8b7SBjeS02iUprI5j61FW86cuhzP154qtRr98pEZ6/TZeJGoAsf+EioDW
	xvzHKMizJS7ct1+s+WjGuiYTY97LHbGo39pgA+HjGuFuwZm04Dw1gm6S2ndREty9xnueH6643X3
	5A5+UxQfzUEO9jfdYRc+00QDhZSnL0Vfo2OAVInJwr9IY84PnPne3yv/7sbnC5nDcQKvUTlq+Xx
	Lg6MUdrnECDsGP706s4P5gwaLvAwSGWJza8L4dzWYA05k+3ASbOiWdSzBnUhZRdb2trlsdWLNkC
	8Um7qxQGM8qf3FeW/9IQQ6sX02jJfjY+E/YskasvaF7kjoLiMHKnvUtCd5rIYz9/haLgIxrQqIF
	MOQmrcBJSqBGZqEKbcuiVwzKTpEqzRUbngaWAhomwJdpQoHmz993Nli+QYB9oW6J/LIL0
X-Received: by 2002:a05:6512:3d93:b0:5be:3d95:3c7e with SMTP id
 2adb3069b0e04-5c003c084f6mr599060e87.65.1793958602580; Fri, 06 Nov 2026
 01:50:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261017030927.345454-1-suunj1331@gmail.com> <au01Qocxd1gsXs42@inochi.infowork>
In-Reply-To: <au01Qocxd1gsXs42@inochi.infowork>
From: SeungJu Cheon <suunj1331@gmail.com>
Date: Fri, 6 Nov 2026 18:49:51 +0900
X-Gm-Features: AclHuK_aMmYFw0Il5my2_hqoI2l0YbFq5ppI5iN9PgB32Mkgeg9mxiSxKYMIzIU
Message-ID: <CAGwK=3q7MuQQxMZSS=c=UxXX08xgwPqs7kpsPy1EiXgbZbknCQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Only fast-path dirty-log write faults on
 host-writable leaves
To: Inochi Amaoto <inochiama@gmail.com>
Cc: anup@brainfault.org, atish.patra@linux.dev, tjytimi@163.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	andrew.jones@linux.dev, pbonzini@redhat.com, seanjc@google.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_015009_730216_D3B92A00 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgNiwgMjAyNiBhdCAxMTowM+KAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+IEkgZ3Vlc3MgdGhpcyBmaXggbWlzcyBhIHBhcnQ6Cj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+
IGluZGV4IDUzYmIyNWE1YTYwYi4uMWIzNWFiOTgwYTEwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtNzYxLDcgKzc2
MSw3IEBAIGludCBrdm1fcmlzY3ZfbW11X21hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVj
dCBrdm1fbWVtb3J5X3Nsb3QgKm1lbXNsb3QsCj4KPiAgb3V0X3VubG9jazoKPiAgICAgICAgIGt2
bV9yZWxlYXNlX2ZhdWx0aW5fcGFnZShrdm0sIHBhZ2UsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW51c2VkIHx8IChyZXQgJiYgcmV0ICE9IC1FRVhJU1QpLCB3cml0YWJsZSk7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW51c2VkIHx8IChyZXQgJiYgcmV0
ICE9IC1FRVhJU1QpLCBob3N0X3dyaXRhYmxlKTsKPiAgICAgICAgIHdyaXRlX3VubG9jaygma3Zt
LT5tbXVfbG9jayk7Cj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiBSZWdhcmRzLAo+IElu
b2NoaQoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKU2FzaGlrbyBhbHNvIGNhdWdodCB0aGlzIHNo
b3J0bHkgYWZ0ZXIgdjEgd2FzIHBvc3RlZC4gSSdsbCBpbmNsdWRlIHRoZQpmaXggaW4gdjIgYW5k
IHNlbmQgaXQgc2hvcnRseS4KClRoYW5rcywKU2V1bmdKdQoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
