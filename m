Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E64CD6E74
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 06:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nsY+jGW42z2pxNaBshgw5WKZx8Bbhlyj4+KSSma72Q8=; b=qp8YKfGgUMq8F/
	e7Pk7jav8E2RcaZr4BugRhM5ze3dFUDWVVActkpsJx+qYZSyicYy5JUxnSiS4wxcHGB2feBhITWxa
	soVML5lDyFrrQT1fBx6oYkBdYTyJhOOZYwfKl4LwjrHUeR40ReNTJ0G4+qougH+Vfh8fwoytUbVlA
	cdeg3aFHPCx7DYYwMbJiweR8Qa0fr1Q+3g+UqiiXHIgUtGgVfGWpjK1cTHgI/BIAf6rw/eBQqLu4j
	rlFLNl6DWhIhul7oBlPOw6zL+5iJNpFNoJnGHVdsuSqwhqHXIB6lmoxnUR8aLUVD/dretFl4BD0xW
	sGV7tGTTmNO3BtSgpWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOMn-00000000BVy-3tYn;
	Fri, 05 Jun 2026 06:49:17 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOMm-00000000BV4-0otV
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 06:49:17 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-69e06aaf0b2so1130640eaf.1
        for <kvm-riscv@lists.infradead.org>; Thu, 04 Jun 2026 23:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780642154; cv=none;
        d=google.com; s=arc-20240605;
        b=aLL7JxKh255JxLqluriJH1ZeYrYUBwhot/mahZx75MpyW2zuU7m5IOdeOV1cQq8aiQ
         oL5s58pKLmElu37rAT4na1bgozJUw3qv8yM3cBCbGHhv5F06GeV8t0i33udEiSovO71k
         nZsLZFxwQlMt3J5m0wx44HMBLk9tlQraFDj1PS+sH35AYGwPIn4y2oD6Wc07+PGb6TS4
         OVRcJlXNYLoMZJxKLWG+0I387KjMUKBuYtTYtwG7EawEL7Nd+HinXnpC/h0Pvme5UUQ6
         k9nW2lzKl4smfyPonBVnEcO1lIexO9r6nn/9+A+f6GxaLnkaVAtaG7rbwN3Hh8AibOiH
         tv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6XDq1xh1XzOsuKw97N0TVXndgcJC/tzYgMFv9LJzmno=;
        fh=RyCxkg9SVlBlZ3MDhr9tIBo7uuSThKb7ApGeH8xZG70=;
        b=FyplN6txpuynOXmuCdL+ZraVMneA1hZJqHLyv6GJ1lh8uzl0mg+C6Fhs4xzoOdnyuh
         duaw1OoT4b5QeXJuLMamqqM3pZjrkrgDdKgTHtGWznnrF2NsOV1C49siBBg4Yh88hykb
         38QUvprJciucDN8UXrKip4AireAfKH/AwHId/yfWpVNvwmPKjwoMaljGDCPy9qc3V08I
         WDWmtKVSpqNHg+oEUlts6aQvXUp9Kd4/dC4jN4kLVIC3EDMzN/2N3cCf9UauKYa8CHDG
         LV6B2xq5woYZs+CgqIHNVzU82FWR4t+HWBHZSN+UW99QMFkEQ2ed7A7F6CknWLMCrSIb
         CDSA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780642154; x=1781246954; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XDq1xh1XzOsuKw97N0TVXndgcJC/tzYgMFv9LJzmno=;
        b=O2Df4XSY0FYXmc+cBNOGFqlPaTHEWTHDEADw+YfrPpJ0RtaCXzhgXJxEqmMALxKURM
         hIX0HRZCDTxpyVn5R8+r7GyeXOho/w6O/IJ87ayvG07pC7Rde98uOnnc3yMyeRpvjkcs
         DZYcpVd2UbQkog6SccwGqu+x/NjUUmoQeQLLSwzohy8KHaZp5dbOAc2iImAfvD3kRubg
         19vCr7pOD6du7Q3Mnyj7YZmsEtYsVyLsN01Uxi6Tgh6S+uiNWTR3ZLbDae2JR0blzP4o
         nUoYrzSQXwCf/rvW8GM20Yj43pSaXsxe2AdqfiJn/KAYv0NaSbxbiuE9tot+YG3LEUxV
         RGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780642154; x=1781246954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XDq1xh1XzOsuKw97N0TVXndgcJC/tzYgMFv9LJzmno=;
        b=TEjj9rD5wtZ/SWr8H/dlVYFxfi1/EXz8tAxyym9EuR+R/aOg3dUdQmNS5kNr3UwRjf
         MEzspr6QP1+u99giRcYIaqYTOM9rbdlA95kFUQ5o889q0q3tKwj70tywToc4Foh+NYtO
         /mvt/0QwDo4noSgiGm5r7Xz9xd4F4eis2LSPl56mIs5aoLniccnA8gvElgqXBfrwqlv+
         S+tvZDUb6m0n3sKGkeApiO1+qmNVp9CHOon0BYn3vXNBSReHd0ErjP9X0kaIXeVUosVs
         9DAqwbDvGIEBrdsKG1qB0uoYlnTJ0e3r2lQ04C2+a3c/G58E3BBz4QgoTaqIUkSNo0St
         39SA==
X-Forwarded-Encrypted: i=1; AFNElJ8MlnSIPY11nebDphzkTMVIsK+dSdW29KC+BRdulFtyksX3gDj52KjDpVWDIW7cUZrqwloo/xUnxM4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVZz8lTXh/Aeh2ZYGUgsi3yBXhG1YTU5c35fUDzTHzDg+dy7kL
	l5qyjGTIMIqAJKCNmqgYMvG079hZeMmMjcT4d+hBIjIt/fjik4bADoOVSn3Q8wySpvfx4wH1mwN
	cyqgyUeqxuwl+S3tlTfjFlooTn8jBVx+HD42ChBkbog==
X-Gm-Gg: Acq92OFTlCgSIRbqUDGfApZgkeR2R4oCXwyT9z4ew9YzmQ7y99kbaPyRSIRtyZ/y+Qs
	Ocv5moaTb0kuCdxe84RJO9lnJB90JXkZfdn2eVXz+xboztKoKbKNYv1gqy8Z7bjvwCoWimYXANk
	JHItLpkNAWT1lhgaAdKAxCVNdz5Fxo9eGhTegAH/QfKm6pzvQJ74t8RBon0Kvt/u5oynKzLeyJV
	AyPb9L16qIDJAOLc4qofIpNFb2Xd2qzWWInQzTdotCC+B1fFhMRQWP51T8TC27Zq9FStBJGj9YD
	cXuOS8GWr1MB3J8Fyicjl9OV9VmrzQY5s36jLCUZrFyW8dluyuV+hFQrKb2yezh+B9iw9KOefmO
	BYDj5j09FrgBn/WFLpovzDYJ1tThZ0OBY7iVH
X-Received: by 2002:a05:6820:561c:b0:69b:6d47:8180 with SMTP id
 006d021491bc7-69e68c23141mr771817eaf.39.1780642154512; Thu, 04 Jun 2026
 23:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260528113840.2629186-1-inochiama@gmail.com>
In-Reply-To: <20260528113840.2629186-1-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 12:19:03 +0530
X-Gm-Features: AVVi8CeHnuM2CioMa5An9kIeCY2Cck7qIHe-9yB0iUqpIPQzrG2HNoEWHmj4vmY
Message-ID: <CAAhSdy096z4SdwQKBxM0ZtE5=i3UZrhMD-BcES9UdP5OgajqEA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Enhance the logging check for mmu mapping
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_234916_376629_08E52E17 
X-CRM114-Status: GOOD (  20.93  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXkgMjgsIDIwMjYgYXQgNTowOOKAr1BNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2hlbiBlbmFibGluZyBkaXJ0eSByaW5nLCB0aGUgZGly
dHkgYml0bWFwIGlzIGRpc2FibGUsIGFuZCB0aGUgbG9nZ2luZwo+IGNoZWNrIGlzIGFsd2F5cyBm
YWxzZSBhcyB0aGUgUklTQy1WIGFyY2hpdGVjdHVyZSBkb2VzIG5vdCBzZWxlY3QKPiAiTkVFRF9L
Vk1fRElSVFlfUklOR19XSVRIX0JJVE1BUCIuIEFsdGhvdWdoIHRoZSBkaXJ0eSBsb2cgaXMgcmVj
b3JkZWQKPiBzaW5jZSB0aGUgd3JpdGUgcGF0aCBhbHJlYWR5IHRyeWluZyB0byBhZGQgdGhlIGRp
cnR5IGxvZywgdGhlIGxvZ2ljIGZvcgo+IGxvZ2dpbmcgY2hlY2sgaXMgYnJva2VuIGFuZCBzb21l
IHNpZGUgZWZmZWN0IHdpbGwgb2NjdXJzLgo+Cj4gRW5oYW5jZSB0aGUgbG9nZ2luZyBjaGVjayBm
b3IgbW11IG1hcHBpbmcgc28gaXQgY2FuIGNoZWNrIGJvdGggdGhlIGRpcnR5Cj4gcmluZyBhbmQg
dGhlIGRpcnR5IGJpdG1hcC4KPgo+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2No
aWFtYUBnbWFpbC5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jIHwgOSArKysrLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5j
Cj4gaW5kZXggMmQzZGVmMDI0MjcwLi5iNTg3M2JjYTlkY2UgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rdm0vbW11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IEBAIC0xNDIsOSAr
MTQyLDggQEAgdm9pZCBrdm1fYXJjaF9jb21taXRfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICpr
dm0sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGt2bV9tcl9jaGFuZ2Ug
Y2hhbmdlKQo+ICB7Cj4gICAgICAgICAvKgo+IC0gICAgICAgICogQXQgdGhpcyBwb2ludCBtZW1z
bG90IGhhcyBiZWVuIGNvbW1pdHRlZCBhbmQgdGhlcmUgaXMgYW4KPiAtICAgICAgICAqIGFsbG9j
YXRlZCBkaXJ0eV9iaXRtYXBbXSwgZGlydHkgcGFnZXMgd2lsbCBiZSB0cmFja2VkIHdoaWxlCj4g
LSAgICAgICAgKiB0aGUgbWVtb3J5IHNsb3QgaXMgd3JpdGUgcHJvdGVjdGVkLgo+ICsgICAgICAg
ICogQXQgdGhpcyBwb2ludCBtZW1zbG90IGhhcyBiZWVuIGNvbW1pdHRlZCBhbmQgZGlydHkgcGFn
ZXMgd2lsbCBiZQo+ICsgICAgICAgICogdHJhY2tlZCB3aGlsZSB0aGUgbWVtb3J5IHNsb3QgaXMg
d3JpdGUgcHJvdGVjdGVkLgo+ICAgICAgICAgICovCj4gICAgICAgICBpZiAoY2hhbmdlICE9IEtW
TV9NUl9ERUxFVEUgJiYgbmV3LT5mbGFncyAmIEtWTV9NRU1fTE9HX0RJUlRZX1BBR0VTKSB7Cj4g
ICAgICAgICAgICAgICAgIGlmIChrdm1fZGlydHlfbG9nX21hbnVhbF9wcm90ZWN0X2FuZF9pbml0
X3NldChrdm0pKQo+IEBAIC00MzMsOCArNDMyLDggQEAgaW50IGt2bV9yaXNjdl9tbXVfbWFwKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCwKPiAg
ICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+ICAgICAgICAgc3RydWN0IGt2bSAq
a3ZtID0gdmNwdS0+a3ZtOwo+ICAgICAgICAgc3RydWN0IGt2bV9tbXVfbWVtb3J5X2NhY2hlICpw
Y2FjaGUgPSAmdmNwdS0+YXJjaC5tbXVfcGFnZV9jYWNoZTsKPiAtICAgICAgIGJvb2wgbG9nZ2lu
ZyA9IChtZW1zbG90LT5kaXJ0eV9iaXRtYXAgJiYKPiAtICAgICAgICAgICAgICAgICAgICAgICAh
KG1lbXNsb3QtPmZsYWdzICYgS1ZNX01FTV9SRUFET05MWSkpID8gdHJ1ZSA6IGZhbHNlOwoKV2h5
IGlzIHRoaXMgbm90IGNvcnJlY3QgYXBwcm9hY2ggdG8gZGV0ZXJtaW5lIHdoZXRoZXIgbG9nZ2lu
ZyBpcyBlbmFibGVkID8KCktWTSBBUk02NCBkb2VzIGEgdmVyeSBzaW1pbGFyIHRoaW5nIChSZWZl
ciwgbWVtc2xvdF9pc19sb2dnaW5nKCkgaW4KYXJjaC9hcm02NC9rdm0vbW11LmMpLgoKPiArICAg
ICAgIGJvb2wgbG9nZ2luZyA9IGt2bV9zbG90X2RpcnR5X3RyYWNrX2VuYWJsZWQobWVtc2xvdCkg
JiYKPiArICAgICAgICAgICAgICAgICAgICAgICEobWVtc2xvdC0+ZmxhZ3MgJiBLVk1fTUVNX1JF
QURPTkxZKTsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgdm1hX3BhZ2VzaXplLCBtbXVfc2VxOwo+
ICAgICAgICAgc3RydWN0IGt2bV9nc3RhZ2UgZ3N0YWdlOwo+ICAgICAgICAgc3RydWN0IHBhZ2Ug
KnBhZ2U7Cj4gLS0KPiAyLjU0LjAKPgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
