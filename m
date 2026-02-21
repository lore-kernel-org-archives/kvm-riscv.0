Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD52C61DE4
	for <kvm-riscv@archiver.kernel.org>; Sat, 21 Feb 2026 10:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WoT87Q77sH1/F0rUhjK05+qQqDxMHHWwhpmpoVqs2vA=; b=zYAkDhF1/s3xDH
	JAc0aUwrhRnBEzSLbwtmlj/M+ApjOXy9OaRETplKwr9+2GaZvOYmpQVIap7eT43YBz5HHO0MpNmbP
	qQ/RZ8tI6Qx2+kXJhPAlboOXZbwshOKaAqRVyba4I8kxBFBB9K5RqSW+SQTfm4BCixCMZUz/PFYSc
	YOMMDfGRuI2KHF3vFFInP00sG0F8HT9nT/oBlpoH5KwI3iGGMfM54j5kP2Bvq45lUXSXeEs+zIyXX
	SMsGQ6X+W8UYuq9nUMffSNrH6yRtmpeEdU1R8INyH4J3wMPGeNWFQEidzfzP2SE3XbiyGolQExk0q
	OMF+++oXmuPagPtZUzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtkZe-0000000FzV0-1KhI;
	Sat, 21 Feb 2026 10:50:58 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtkZb-0000000FzTd-1rVT
	for kvm-riscv@lists.infradead.org;
	Sat, 21 Feb 2026 10:50:56 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-649db2b6cdcso2497847d50.0
        for <kvm-riscv@lists.infradead.org>; Sat, 21 Feb 2026 02:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771671054; cv=none;
        d=google.com; s=arc-20240605;
        b=Iy0L22P5851eD+6WQ+DeF7GaNUPlu59srekNZtlETpa2FPH37uEqkJ1qxmz5i7MfuR
         z8qVgdYjE9jsCQucysIf8fjEGe/K1YYoHEvTrbpVn9WG342guMNfX5kP2jS59sPCqrhH
         xdGeVJUdWdJnOahwvnwm/oMkYTM51OopdQkKv4eOr6ZmlBiSHafmTS5fC8GSTQbgLhC2
         y8COwwkhpk/xqwTwSLq8Mayy+FVZIMl8msgytNePAdGyKBLonRHiKtU9T0BKlMbnlPw8
         E6mcJQF8IfLbm+0ejGMKoR75yOgwkZ3wzQIaE/8zJKdgWpP1UIWDBLEhO8vIyO++TCtY
         lgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iX49jux/4IXgi5L4udtJMMhfexmcVR566shHk1rThtE=;
        fh=pKxUGwEzkEaAl6ltXXP+oOKtP9TVy3QQTj6uDafLfFM=;
        b=WfPGp3/6mSiEl9gOtjlwhf/FNwjZ2BWcw1gIQMSHTVY4V8tHcIiWwBJqFhVF9HqIiT
         BJclql3OBDX94GHwjWtVBfHMIV/csQ/jP2ROW/z5qu2aQUFStJDL4P2/XPiZpRZwBKth
         5nTqxBFbzBV1OD/BqqfQZU4Jc7ultupc2R9w8UqoNd9mrdiRQBLviXTM95jcw6B1spDA
         jfybsJ8zag8KyyCImVaO8upt9Y7XQ+JX5pWqcW4TJKEhdZM4EWblrcHdn0uCg6vPYixb
         JznRxlgjeROrlv/IPE4xwUApQtTMtAMbaZ6SgzsLKZFd3DPR1Zqs44lsoEUQNyR8TdR0
         MMgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1771671054; x=1772275854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iX49jux/4IXgi5L4udtJMMhfexmcVR566shHk1rThtE=;
        b=VZYb5HBBNIcabalfBHsZ030laTL/DLX2ejS7tEjIHnbYGHlwbeTkwhpctYlHL8HGpr
         wpaOLtitC/iMEVqUFZN2CUO4QSGpjSEiDoOnp1UnTy4YfRXuNMSUkhKbchDQJxB9Lyy0
         7McM5OUtykI7kQ9VJo+UHAF0pgHxIsm7q2kFX9AMlA08afNq9LsyRvcV4cf0KK0HnGgn
         Gx3eGblaTsmlq15RipTr/XFAAYKCY/99EzZ11t3x+Ww0xqYgonucpGXkMnezOn4btCFP
         DYLqxGeoXDSxonpq8pqJaFE1OA1EoBb8qpnmw8n6QfbHxyCEEoePHAfmW/diH83shERn
         FZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771671054; x=1772275854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iX49jux/4IXgi5L4udtJMMhfexmcVR566shHk1rThtE=;
        b=tavedqbKBkQkrgay+9CUHt8IALpaANT5qiSHW0TF3VKIV77ULV5NB+8tx7PSFl+K8h
         Xb36eCyf5uNIh9a465payG63jb/lkxHAA2SWyU6tkIQCHE5Hh6YOhoHAcsPTyRptyX32
         FLBfupXP1ZMfCjJhn6/97jJJq40i77pstbtZhMP2Ce5v0uhDKuDUQt9MoJMhV/pWfJMN
         GRswZ8QzipHKpGLhUwFoZCCcULJXmFPa48DQDifr+LCqKQrb1m9NogkoTWacKu9Dxg1Z
         EYNOHQvhZOPFLhrck6JKFCdyVW5lXnN2zQjfgQL+rUpuFIt06IfWKAU5Saitmgrn1bA5
         /9Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWUldOn1s+YuMgmZouC+OwXcpZqhCQDbTEnslp24ySblEXCnIgxTLKW8BnAuDX2MNkO+Ukq8VjILus=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPcOCbFId1AuuR6cebXQsn9NGE6Em4sqbGmqIyhdkUfp7XbBYU
	SJSKVOjmpCqP6yuJFW9Pl8i5S/Mow/hjIe68+rPaz6uTE+JP2rhy/K3x1ccFZzBQBD9W3e95gXT
	POOMWtE7VR6KAYK3hDb+M4ajgNsbEMO2gBDh54O1snQ==
X-Gm-Gg: AZuq6aK/R5UBsg8KcC9L2hvdDSx0x6aOW9lp5vSZgqEoLNeU/ux/ztUtYXP/rtgtqKw
	U06YP5CdopeP10/S5P0zBnQKWcZkLP5j7fgaiw4iAC22d7uGM+96uiDU8Dxfon1S6+2YMkIr78G
	b0zbWmIm5mmDPp2jlqXlgByFNGxtVkZe5P5BJn8KU+ahDoZAkiJv1voD8vz9WbKf2gGuPGJxuN7
	Ti4jwTKUWYZaNk+B/8WhGSDj4YGr+H8CRGNvdminsA761XETgEtVVtzLN7zErpraJHwLgVfXfo7
	7zd6H+0dYj/h7jXw9JJ7+Cm7Px9xLeRi/fCTLa/A8WLR5oufwEM=
X-Received: by 2002:a05:690e:d4f:b0:649:b943:2cc6 with SMTP id
 956f58d0204a3-64c78d2540fmr2087778d50.52.1771671054439; Sat, 21 Feb 2026
 02:50:54 -0800 (PST)
MIME-Version: 1.0
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com> <20260206002349.96740-8-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260206002349.96740-8-andrew.jones@oss.qualcomm.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 21 Feb 2026 18:50:43 +0800
X-Gm-Features: AaiRm53RGq4SjluQ7rY8hknIj4t9V-QSTFAH2aru43ccuu0WX9kk8F8JI5HKec8
Message-ID: <CAH1PCMa96hdU+aZ6W48GQDj=FEoO=4P3VOZrUNi-g6WYaopKUg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 07/11] riscv: Export have_user_pmlen* booleans
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Charlie Jenkins <thecharlesjenkins@gmail.com>, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_025055_508780_83AA65EB 
X-CRM114-Status: GOOD (  18.60  )
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

T24gRnJpLCBGZWIgNiwgMjAyNiBhdCA4OjI04oCvQU0gQW5kcmV3IEpvbmVzCjxhbmRyZXcuam9u
ZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBBIGZvbGxvd2luZyBwYXRjaCB3aWxsIG5l
ZWQgdG8gYWNjZXNzIGhhdmVfdXNlcl9wbWxlbl83IGZyb20KPiBhbm90aGVyIGZpbGUuCgpUaGUg
dmFyaWFibGVzIGFyZSBtYWRlIG5vbi1zdGF0aWMgaGVyZSBidXQgd2l0aG91dCBhbiBleHRlcm4K
ZGVjbGFyYXRpb24gaW4gYSBoZWFkZXIuCgpIb3cgYWJvdXQgYWRkaW5nIHRoZSBkZWNsYXJhdGlv
bnMgdG8gYXNtL3Byb2Nlc3Nvci5oLCBpbnNpZGUgdGhlCnByb3RlY3Rpb24gb2YgdGhlIENPTkZJ
R19SSVNDVl9JU0FfU1VQTSBibG9jaz8KCnN5c19od3Byb2JlLmMgYWxyZWFkeSBpbmNsdWRlcyBh
c20vcHJvY2Vzc29yLmgsIHNvIG5vIG5ldyBpbmNsdWRlcwp3b3VsZCBiZSBuZWVkZWQuCgpQUzog
SSBzcG90dGVkIG9uZSBtb3JlIG9mIHlvdXIgcGF0Y2ggWzEwLzExXSByZWZlcnMgdG8gaXQsIHdo
aWNoIGFkZHMKYW5vdGhlciBiYXJlIGV4dGVybiBpbiBjcHVmZWF0dXJlLmMuCgpCUiwKR3VvZG9u
ZwoKCgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAb3NzLnF1
YWxjb21tLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIHwgMTIgKysr
KysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gaW5kZXggMzFhMzkyOTkzY2I0Li40ZmExNGFmZjdmOGQg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gQEAgLTI3NCw4ICsyNzQsOCBAQCBlbnVtIHsKPiAgICAg
ICAgIFBNTEVOXzE2ID0gMTYsCj4gIH07Cj4KPiAtc3RhdGljIGJvb2wgaGF2ZV91c2VyX3BtbGVu
Xzc7Cj4gLXN0YXRpYyBib29sIGhhdmVfdXNlcl9wbWxlbl8xNjsKPiArYm9vbCByaXNjdl9oYXZl
X3VzZXJfcG1sZW5fNzsKPiArYm9vbCByaXNjdl9oYXZlX3VzZXJfcG1sZW5fMTY7Cj4KPiAgLyoK
PiAgICogQ29udHJvbCB0aGUgcmVsYXhlZCBBQkkgYWxsb3dpbmcgdGFnZ2VkIHVzZXIgYWRkcmVz
c2VzIGludG8gdGhlIGtlcm5lbC4KPiBAQCAtMzA2LDEwICszMDYsMTAgQEAgbG9uZyBzZXRfdGFn
Z2VkX2FkZHJfY3RybChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHVuc2lnbmVkIGxvbmcgYXJn
KQo+ICAgICAgICAgcG1sZW4gPSBGSUVMRF9HRVQoUFJfUE1MRU5fTUFTSywgYXJnKTsKPiAgICAg
ICAgIGlmIChwbWxlbiA9PSBQTUxFTl8wKSB7Cj4gICAgICAgICAgICAgICAgIHBtbSA9IEVOVkNG
R19QTU1fUE1MRU5fMDsKPiAtICAgICAgIH0gZWxzZSBpZiAocG1sZW4gPD0gUE1MRU5fNyAmJiBo
YXZlX3VzZXJfcG1sZW5fNykgewo+ICsgICAgICAgfSBlbHNlIGlmIChwbWxlbiA8PSBQTUxFTl83
ICYmIHJpc2N2X2hhdmVfdXNlcl9wbWxlbl83KSB7Cj4gICAgICAgICAgICAgICAgIHBtbGVuID0g
UE1MRU5fNzsKPiAgICAgICAgICAgICAgICAgcG1tID0gRU5WQ0ZHX1BNTV9QTUxFTl83Owo+IC0g
ICAgICAgfSBlbHNlIGlmIChwbWxlbiA8PSBQTUxFTl8xNiAmJiBoYXZlX3VzZXJfcG1sZW5fMTYp
IHsKPiArICAgICAgIH0gZWxzZSBpZiAocG1sZW4gPD0gUE1MRU5fMTYgJiYgcmlzY3ZfaGF2ZV91
c2VyX3BtbGVuXzE2KSB7Cj4gICAgICAgICAgICAgICAgIHBtbGVuID0gUE1MRU5fMTY7Cj4gICAg
ICAgICAgICAgICAgIHBtbSA9IEVOVkNGR19QTU1fUE1MRU5fMTY7Cj4gICAgICAgICB9IGVsc2Ug
ewo+IEBAIC00MDcsOCArNDA3LDggQEAgc3RhdGljIGludCBfX2luaXQgdGFnZ2VkX2FkZHJfaW5p
dCh2b2lkKQo+ICAgICAgICAgICogQXNzdW1lIHRoZSBzdXBwb3J0ZWQgUE1MRU4gdmFsdWVzIGFy
ZSB0aGUgc2FtZSBvbiBhbGwgaGFydHMuCj4gICAgICAgICAgKi8KPiAgICAgICAgIGNzcl9jbGVh
cihDU1JfRU5WQ0ZHLCBFTlZDRkdfUE1NKTsKPiAtICAgICAgIGhhdmVfdXNlcl9wbWxlbl83ID0g
dHJ5X3RvX3NldF9wbW0oRU5WQ0ZHX1BNTV9QTUxFTl83KTsKPiAtICAgICAgIGhhdmVfdXNlcl9w
bWxlbl8xNiA9IHRyeV90b19zZXRfcG1tKEVOVkNGR19QTU1fUE1MRU5fMTYpOwo+ICsgICAgICAg
cmlzY3ZfaGF2ZV91c2VyX3BtbGVuXzcgPSB0cnlfdG9fc2V0X3BtbShFTlZDRkdfUE1NX1BNTEVO
XzcpOwo+ICsgICAgICAgcmlzY3ZfaGF2ZV91c2VyX3BtbGVuXzE2ID0gdHJ5X3RvX3NldF9wbW0o
RU5WQ0ZHX1BNTV9QTUxFTl8xNik7Cj4KPiAgICAgICAgIGlmICghcmVnaXN0ZXJfc3lzY3RsKCJh
YmkiLCB0YWdnZWRfYWRkcl9zeXNjdGxfdGFibGUpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiAtLQo+IDIuNDMuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
