Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7698CEDA687
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5t8yvcD0DWdzOnnbzk8CjnUk3M/joFZtNKKI2ie97EI=; b=a34+0DNXW23JGd
	U2roHxF/p4L5mKAyPIdX7MU03TFE3QWZhCHT3MuGm5Q0+a5n6Aknou+u25zuyFwwEGuId+is67QxN
	zLoeP2BNBP5d6iKOkht7QSY+H63XjithJrfKOrmW6Mpxl6BRT7RRz/ix53skude/uae/2sfWwiGHX
	reu5+gaqTQNaHtU+RdxUApm8QVCXiJD9HozSBFcIKbCIgugCmA/k/ciQ+G0H3u1QJXMS6ANt/3Dtp
	wt5aBZPQtZc/7eCf5rJkE2U1oQvKUvvAeK5eWnNQWZvNSKTqRIif2wVRtoSpT45n9vfbPCQ2WMnTX
	Di2XpQ81ovLLvhJZT6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRxu-0000000FSLW-3uy4;
	Tue, 03 Mar 2026 15:47:18 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRxr-0000000FSIx-2t5b
	for kvm-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 15:47:17 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-677bb1c3a9dso2021123eaf.3
        for <kvm-riscv@lists.infradead.org>; Tue, 03 Mar 2026 07:47:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772552835; cv=none;
        d=google.com; s=arc-20240605;
        b=WBfk5gVkOuChWs4YdKoy+jcEf4wPj5FqCqTLdMc/5cNeF4i+2/pHReLXBepePuVGak
         JXZA3HueGdWCzQrBoLtBQhqkg+D+q+rmh+/3KXDf4+4D2sSR/7ld8cgxfdA/HefXHEDA
         LANteTN4kW9IBaUHyPoAZEO6GleZ9jyjKdo5FMvHXstIEd7R6hiJqQ+jRy6HlOLybBPs
         o993S7fCKU2xw7G/Z/FluBMkiQzfo7bObHvsSP93lHcWhHO+SdFY7akwVDcgAfNLe7NL
         hJ4Dv9fYyNlcbvJoeRTQSARlFa3XQQA1dNGm2ecFE/7ag6kvwJswlJVoFtfEPu/y9mbi
         B3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rP5o/eMOPhz1A5eUQwkaAxR1nnewuBUqV7uC86UfM1k=;
        fh=7fi8oG9+i6em4K9ViKcsVhuAMlazw9hM08ZhcNSZ1V4=;
        b=SopjuaIW1ScSjkmYtY3KM8VOmxy4azGYkl9fAg9ZMM9LWD2ySevxb8oJ6N1Z7prYOb
         Fwm2EDmeaBDu5anmkdIexkL8sxX2ti3rAU7ldROyTEpMyOWGGpTJoYT/4xH+YV5FL7mn
         25ScmthskdoHqM3rgT4odFBZ/zY8ohwKIwpRgwNp8rOMa8HhFIZR5uW3K2xnB7bgH6B1
         EvS5KxpGaCtoscYDLUUF0x7ed6ATQKUo2+z5IlCqibdw5I9NIyKmmbWgzARqdNeQcaCe
         wRdf5sVMDLQTyT7Rhz8LTZuSYc2XWojHXfM+QRaEUVx6Lh6o44RF8mMf96sWPyDd5C2b
         y3Tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772552834; x=1773157634; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rP5o/eMOPhz1A5eUQwkaAxR1nnewuBUqV7uC86UfM1k=;
        b=0WiZmIhOoJkeqs3+jWsKwbK+lFPs/HiwgrPA1K4/f0z4QEw10zxdY33/p+EasVCwt0
         eEhmfcvugPPETWZmINj0rP8oh3U1a3NFBraohTByJV/98UTgA8nxPec5LUUfByGdYOvW
         zF77NW+/n2R92CDTZ8kyNP5hu7gZLyxuuXMbjFOi0DJZPD2sMJSSF0iub5Tm6f9fe3id
         9/gWpF6foSHzsUsIjEkt3krWDTuzjqmoButVCDcag+4QQfv1jWq45WPeWp8OZ19nZBi8
         61m4qMKr6t7idWSXZLtro3dpDDx3q+qrbMdu/794802AdSPsQj1KqKfMiqddhd+EcuQ2
         JxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772552834; x=1773157634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rP5o/eMOPhz1A5eUQwkaAxR1nnewuBUqV7uC86UfM1k=;
        b=TNf+wOGqFFGACoSlDLvUHsmQsvqZ4UP9bsWV2+TJC/rfVFshHtLo8DeA5ZilUt4FTc
         DfEP9J8Cew5q/BGGdLdlJokDLdbBuEwzgI08ESkOG2UgCTa4C7+foQGcQgoir+SIdG+u
         UNeQSVJq623ZgZ17I8OxFZdMXQiGy2P7vzx2xoSNUfTfC67e7RR+V17AxSP7K4WYQ9mJ
         EUSbM0xW0HqKssCXaa/hs+gOcIf5Jrn4gk4+rhLVonQzWDLXYfSDRd0cGl8Lq/VbQp0C
         2YtAsg+NiPSF8drS+3CgRx5t7drHA4KSUnV3v9uybVsMgGofqxbl9qAS6VB33tYnWfsM
         V5Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVeVCnZ9Zah2rXKnNc6thYD3XPPHGdcg2uZ4j/Iy8T4EUX2Mtb2NcmfYuqJponvx14Igq7xs/NIIlw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzkNSCNaxU/hZ/bPJQ4ZPX70P+PNG7dZw5q1djw7y+PiyRPHLkk
	oXmS12Dhume9E7j0JF7IE+KaPNcrGCd9tGbHW7JGl8fNyVPNzy7wGuppeDlPb1TkNO8+gcbrb3O
	TmE6zvgiBK2j4lzOqDYBaiVk3+nsY+QHtYL70Ee7obQ==
X-Gm-Gg: ATEYQzx1mChDTbxU3FN3nwOUu8oys9cKZvE6H/wHOh+85Y3VcTjDCuFJKIfpkQVdHK9
	wmoz17KAXIuWRYzr3jQgK1YIcTPt2bWLa/htotr766xQM690AVEm8X3Mk2pEgIkgVh6K97a9g8j
	/y9IVAIj4tBWfsjlJGRzuCdHKOTLA/+ohmKbqJoHKFl5i2cyF/rlFmEwXBFaCOsjDUANlebHxBT
	xXnuIsjo180rPizPLc3ZnnhCFXY8CtSL/cpC+hiHceAoFIO8unNfEZNS3VwJv328/uKAyA28T7w
	tktAdDhe3z+s2kMT13MPqukVkxunB7Gsf1l66sXXRC4HANqCPJyRI5+qmgbQDVsOmPVFFMw4ufu
	Ux8Qn8B3x1Cucm8RxuIlqWgZwdg==
X-Received: by 2002:a05:6820:e03:b0:67a:2e3:2236 with SMTP id
 006d021491bc7-67a02e33328mr4850345eaf.23.1772552834606; Tue, 03 Mar 2026
 07:47:14 -0800 (PST)
MIME-Version: 1.0
References: <20260226191231140_X1Juus7s2kgVlc0ZyW_K@zte.com.cn>
In-Reply-To: <20260226191231140_X1Juus7s2kgVlc0ZyW_K@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 3 Mar 2026 21:17:00 +0530
X-Gm-Features: AaiRm53Tv0HzLC60XnuOQhFibZnnDvaLlp6Dmpq9sGHC5_WRwzY-t4oW2N6N_TA
Message-ID: <CAAhSdy1Z_rWHW6ra3DTR1h2NeVJoM72SZ85ph-TKWRQqYzrEmA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Skip THP support check during dirty logging
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, liu.xuemei1@zte.com.cn, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_074715_985190_80A603A1 
X-CRM114-Status: GOOD (  15.75  )
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

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgNDo0MuKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gV2hlbiBkaXJ0eSBsb2dnaW5nIGlzIGVuYWJsZWQsIGd1ZXN0IHN0YWdlIG1hcHBp
bmdzIGFyZSBmb3JjZWQgdG8KPiBQQUdFX1NJWkUgZ3JhbnVsYXJpdHkuIENoYW5naW5nIHRoZSBt
YXBwaW5nIHBhZ2Ugc2l6ZSBhdCB0aGlzIHBvaW50Cj4gaXMgaW5jb3JyZWN0Lgo+Cj4gRml4ZXM6
IGVkN2FlN2EzNGJlYSAoIlJJU0MtVjogS1ZNOiBUcmFuc3BhcmVudCBodWdlIHBhZ2Ugc3VwcG9y
dCIpCj4gU2lnbmVkLW9mZi1ieTogV2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20u
Y24+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+
CgpRdWV1ZWQgdGhpcyBwYXRjaCBhcyBmaXggZm9yIExpbnV4LTcuMC1yY1gKClRoYW5rcywKQW51
cAoKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMGI3NWViMmExODIw
Li5jMzUzOWY2NjAxNDIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysg
Yi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IEBAIC01MzUsNyArNTM1LDcgQEAgaW50IGt2bV9yaXNj
dl9tbXVfbWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAq
bWVtc2xvdCwKPiAgICAgICAgICAgICAgICAgZ290byBvdXRfdW5sb2NrOwo+Cj4gICAgICAgICAv
KiBDaGVjayBpZiB3ZSBhcmUgYmFja2VkIGJ5IGEgVEhQIGFuZCB0aHVzIHVzZSBibG9jayBtYXBw
aW5nIGlmIHBvc3NpYmxlICovCj4gLSAgICAgICBpZiAodm1hX3BhZ2VzaXplID09IFBBR0VfU0la
RSkKPiArICAgICAgIGlmICghbG9nZ2luZyAmJiAodm1hX3BhZ2VzaXplID09IFBBR0VfU0laRSkp
Cj4gICAgICAgICAgICAgICAgIHZtYV9wYWdlc2l6ZSA9IHRyYW5zcGFyZW50X2h1Z2VwYWdlX2Fk
anVzdChrdm0sIG1lbXNsb3QsIGh2YSwgJmhmbiwgJmdwYSk7Cj4KPiAgICAgICAgIGlmICh3cml0
YWJsZSkgewo+IC0tCj4gMi4yNy4wCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
