Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A0CFC981C
	for <kvm-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJPiWGqxKcBaDSPLWUU/7TNo7vn+Q4Vf3pIl5NJarxg=; b=AJivXLAgCRC+y3
	1d88oKW9jTFLK+pBuC5FD+F4pQTx2WI8O3b/pamFI7mYQ9gHucYFKfJIxHij6v5a5Di9VrJn87GQY
	YLqUkgNg5q7Y/zeWd/L2gkiavVFYEZQRTlBn3GmQd9ClO5YZgibXiErLkZzo2QZkr4lGmbxG6LBup
	xQqc7SYkxjEBmy1vrIlOYHScAMUwlTo+m+Y24sc+fX8MMY1yIdCZyMBlph1GDRRfprNMzD2wx3mO6
	mb0PftD0W1/v38fIj9FuVwR2s7g4d1ONmMPf1gFcVTSB5vLXt2LvcwrHEsa5NDgTe5hr2mMvlKOyh
	xSlD9MTBNYX7GAX56exg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78IF-0000000AuU0-3gTp;
	Mon, 30 Mar 2026 08:48:19 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78ID-0000000AuTL-1o9w
	for kvm-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:48:18 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a133b686f7so4916164e87.0
        for <kvm-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860495; cv=none;
        d=google.com; s=arc-20240605;
        b=cL6aDXlCA+2M9hXvgevuE9rEFbEPZU3Xsa832w5yf0MdVNoTh8w1aNL4jqPQQZ/AUr
         IoRNMvRUICDFEbldRui1Cz8PbWkLorcWcRDwKI9vXZUvFXBMkthE7GRBmMgDr5IbpI5Y
         9XDvlI+wsShHgosOHf/WRAJsOo/D1CjxAqOj04Ml9BPCIu7pIYM9psrm6cEs0nY8hyOt
         11nYn8h8WjUZ0Rre1suZIZR0YGJGalgfvIpLOf4tldS/BCdGCvB2C8Kap35QWFz1F/Im
         csci2sTfsKNuvplTd8srOmjD6F4+LKSvEa+5Ifn8w+p21VSiS2v071EELS54OsSAFRvj
         ZEng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tz/sv6XGOvreioGu+TkOdx3Hk3HFf92lQsBbbJLSqBo=;
        fh=j7MP/V0LnVoHZdTUilaSSX0RyTeMgm2RrqI7bzDkrsQ=;
        b=SFn4J7pi1tIPxf+bdRJIuhuJNtweYh59CrIFo0iS2fK3QuAvgrTrcsuZ2ltRB9IH9O
         bbOQVZfglqiAPLQEMfkz3F1cI1S9Nj0DNwHuY0NwRUnpQPCB50mETghsNp2XRKtaIPvs
         v/HfaOvlHce/tmQZ993HiIMyQGmwcykJLXpIIr8lt9bE8mrtaFYIxHDI2xVGTvCrCoFl
         OpC0BQfrTSTpRYNFrZ64qa9RUtuQ9hasK3Plc9RylXJhCYoX/HyZqReJ9FVgQZuFMLv7
         JS+71aai/oXuZokW5JLZEpFzXvKCgrXSpEKeNsRSsuloD+eNpFwNIc+kWMEOjf7FSZe6
         KfQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1774860495; x=1775465295; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tz/sv6XGOvreioGu+TkOdx3Hk3HFf92lQsBbbJLSqBo=;
        b=lrb7G9Yz623P8DeKeIhijq6HqYNpj3JnRLFF6rsaYERiD403N5ClnRqMT/HIzoBzdr
         dwAnVAwi2LibruDA/s+NQjvldexKlZBtQlMnLDcr5hEfr+GWYtBlB9LEtV+fP05G+Uav
         KUgUr1NpWrU9N1lQF3wB+3GaAsW6C0ToUm3v6AyQjGH1xG/6wNf92lyQ7fz7+BOp0lp0
         A+rEcOg2N1n9/3PojHWs9whtQE7sVGfqQIYMpJbyNppxl8lpyGWExyLRptIYNhO1FVV6
         poVVt0/AugDG/K2aSFC7Gs0zuunsaOSGzcgW6SKQHWDOrgEw684bL6KivrrI+gVncXxc
         qUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860495; x=1775465295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tz/sv6XGOvreioGu+TkOdx3Hk3HFf92lQsBbbJLSqBo=;
        b=E8UWT3w4nnVRzvcPrCpklPZBtvIw4gM3WimyLuPUuUQAhPEn6tuOI0QkU96cX+OEAT
         0U9HX8uuTQ0GWPcSMpb6HJbM3j9pVRK8aIK+nOfnbUO636vnfSAOazmfGh6dQoWV83dY
         NGZqIRvkLsLACzGBpxcs+pzq4DvLvaDcmTYjOS+Fr5G3JzpqLJN7z1cS/8/YdRM/uH9x
         1fwvtqWHV+TXehm27dUDJwtfmge30BEEKWCHBqg9/PPnfFt6Wo0lG32K9HvUG1XEnVA8
         kn6tFJGarhXjFWSNzYSdlcsyrwjgACMRmB3Y850nZIdtPgHdVpVcMqDb5pspNvrxeZwU
         x5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZiPD4Sos2rlH8A6Rx1Lcxmes42V3HSu/Ff/M22XUGh47lWPCieHzqs3vrNEAuShKq7iQrtpxk3QI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxhorG59weo8AM3jb3UpnQFzr/eydU7WgaP6XeYay4TnuQkImyk
	awg8tWjoGdSFWKnEShNkkcWnH046bo6MJloQDs7BqkZwd4CPHEa8kLNgsXK3QLGxm44sWn3slSU
	y+aHWMtbo1j8/dOMnorIP5d+KFCuPWO2zYv4Em8g30A==
X-Gm-Gg: ATEYQzx7nPXJMBPiFr6fL371FCbLeExlZg9EYp+8HVM9Ft5Uy1uzPsTXwTyylLC207B
	x9yAcFnJwqwuM+gwZmfR9SjEvGufQsssAhree2HUC5i35vakQf6/sKPQ6KxX/glPOlkkELLZ/QZ
	Z6O9EwfAcxKF8J02mqzUtLnOrVr/fRYvWKI3SWdD3uYdlhrSc/o6CagVYndbFSxGrVWjyZ6U/UQ
	WYsYPzI2WlmSY6owt89kTffrcR2dWkkNTNljJ6oidaAhVrqVwW9cDEPJ06orA8P712fYLK0zfI4
	RqQKWhS49zx2yZPIThO62oTjzJNUY7B3XQ2A4sXh
X-Received: by 2002:a05:6512:108a:b0:5a1:4158:ea9b with SMTP id
 2adb3069b0e04-5a2ab92066fmr3681883e87.22.1774860495167; Mon, 30 Mar 2026
 01:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <202603301608170032mtkGKX7wRcAkPKDQ5I-F@zte.com.cn>
In-Reply-To: <202603301608170032mtkGKX7wRcAkPKDQ5I-F@zte.com.cn>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 30 Mar 2026 14:18:03 +0530
X-Gm-Features: AQROBzB63KEV8P_Bg0QV0rJAUrTlF3dz8GKfngYrRvwbEkxEjBtIO9GeL0HwnZc
Message-ID: <CAK9=C2Vb73snLT0uEY=5S5dQc6VXc_u4S60+9+sCLpyXZnHTWA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] RISC-V: KVM: Fix hugepage mapping handling during
 dirty logging
To: wang.yechao255@zte.com.cn
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_014817_503125_074389B8 
X-CRM114-Status: GOOD (  13.75  )
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

T24gTW9uLCBNYXIgMzAsIDIwMjYgYXQgMTozOOKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gVGhpcyBzZXJpZXMgZml4ZXMgYW4gaXNzdWUgd2hlcmUgZGlydHkgbG9nZ2luZyBm
YWlscyB0byB3b3JrIGNvcnJlY3RseQo+IHdpdGggaHVnZSBwYWdlcy4KPgo+IHYzIC0+IHY0Ogo+
ICAgLSBTcXVhc2ggUEFUQ0gyIGludG8gUEFUQ0gzLCBhbmQgYWRqdXN0IGFjY29yZGluZyB0byBB
bnVwJ3MgY29tbWVudHMuCj4gICAtIExpbmsgdG8gdjM6Cj4gICBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1yaXNjdi8yMDI2MDMxNjE0MTIzNDAwN3FTQU9zZXN1MmNTUXNqLUxBLXFxM0B6
dGUuY29tLmNuL1QvI3QKPgo+IHYyIC0+IHYzOgo+ICAgLSBwYXRjaDAxOiBBZGQgcmVmZXJlbmNl
IHRvIHRoZSBzcGVjaWZpYyBjb21taXQgYmVpbmcgZml4ZWQKPiAgIC0gcGF0Y2gwMjogRmlsbCB0
aGUgcGFnZSB0YWJsZSBlbnRyeSBiZWZvcmUgcmVwbGFjaW5nIHRoZSBwdGVwIHZhbHVlCj4gICAt
IHBhdGNoMDM6IEFkZCBoYW5kbGluZyBmb3IgZGlydHkgbG9nZ2luZyBkaXNhYmxlIHRvIGF2b2lk
IG1lbW9yeSBsZWFrIGluIGdzdGFnZSBwYWdlIHRhYmxlcwo+ICAgLSBMaW5rIHRvIHYyOgo+ICAg
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNjAzMDQxNzIxMzkxMzFDaER1
Yk1TcEdEVUIwM2xZNFVDYktAenRlLmNvbS5jbi9ULyN0Cj4KPiB2MSAtPiB2MjoKPiAgIC0gZml4
IHRoZSBsb3N0IHdyaXRlIHByb3RlY3Rpb24gb24gaHVnZSBwYWdlcwo+ICAgLSBzcGxpdCBodWdl
IHBhZ2VzIGJlZm9yZSBoYW5kbGluZyB0aGUgd3JpdGUgcHJvdGVjdGlvbiBmYXVsdC4KPgo+ICAg
LSBMaW5rIHRvIHYxOgo+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAy
NjAyMjYxNzIyNDUzNThxVlphdkl5a0xMMlFDMEtvcVRPLUlAenRlLmNvbS5jbi9ULyN1Cj4KPiBX
YW5nIFllY2hhbyAoMik6Cj4gICBSSVNDLVY6IEtWTTogRml4IGxvc3Qgd3JpdGUgcHJvdGVjdGlv
biBvbiBodWdlIHBhZ2VzIGR1cmluZyBkaXJ0eSBsb2dnaW5nCj4gICBSSVNDLVY6IEtWTTogU3Bs
aXQgaHVnZSBwYWdlcyBkdXJpbmcgZmF1bHQgaGFuZGxpbmcgZm9yIGRpcnR5IGxvZ2dpbmcKPgo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaCB8ICAgNCArCj4gIGFyY2gvcmlz
Y3Yva3ZtL2dzdGFnZS5jICAgICAgICAgICAgIHwgMTMzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMzMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPgo+IC0tCj4gMi40Ny4zCj4KPiAtLQo+IGt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKPiBrdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2CgpRdWV1ZWQgdGhpcyBzZXJpZXMgZm9yIExpbnV4LTcu
MQoKVGhhbmtzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
