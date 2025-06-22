Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E7AC7115A
	for <kvm-riscv@archiver.kernel.org>; Sun, 22 Jun 2025 10:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNRyD6lvAC19C70KmL0IMsgksRJXJyhB8mQrk9T/wd0=; b=0kIj0EUFlk6nTg
	5PUXL3NUNdQqZUrVGaECRJBztNluJZlp6gfC5drgqTt+EA96+uGc50hfvkOytYMjo/Iks3Z/frw2t
	vm8uxVWSw58I+vpuHUqCLSO6a/FR18aEyynfbmaH09VTKhZrMHUERjcc/b35pPC/En8YzC6WYeIKu
	aUsg9fwvuweBtGLXv6/AxMQpOTfaiLAw4lCU3BK31RMb6CxeQK7t80hyLU+7xz6eu4glaTB2pbBk2
	H0OHZ6k2Q5SCsGyXfQhZIFfHF4fodB3SikyHLVDr/7MsbdUSC13gxKSnSNs2bcdBjhziIKg5jJdv6
	UCCUDPLkUA/ylSHtCR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTHgI-00000000jt1-23lJ;
	Sun, 22 Jun 2025 10:12:10 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTHgG-00000000jpK-11VL
	for kvm-riscv@lists.infradead.org;
	Sun, 22 Jun 2025 10:12:09 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2363497cc4dso27680485ad.1
        for <kvm-riscv@lists.infradead.org>; Sun, 22 Jun 2025 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750587120; x=1751191920; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhd7Psksfo9MLj/RnU9tn25T95OkdzIn/rvFvguRfxI=;
        b=V9BKqYv/OEXaqPRF48SpERRScy/LhkGfrZ3ef/ce5ej+TDvduNEYB2CojpNj/WbHiI
         HFNiZs+9FA3O+Vn5ZQyiCWZVycLLAE71/+6sa/dabSNe2JhM6BfkvTer4MFqtvpv+DN8
         Kvx6uPdMj0sYkcNPlNr/WgBK7WNb9XkVZERZikuj9R+BZHQFIxY42/v8DN+GbFWzPRWH
         6CfDwqDPoasinVjlIc32MLdFke7H/gtIQL3bQSUmXQ1eEukKxXGMqbO+gJtOJn57u+s9
         Q5gSBo6RO3TKtV/Kf+2Jy8n+UV+07jAbft/gk2E1DKrpDh831Vt4U8nl80uQnO1dn0aa
         ANuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750587120; x=1751191920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhd7Psksfo9MLj/RnU9tn25T95OkdzIn/rvFvguRfxI=;
        b=QG3HAIO8yVZ6uC0vHiydr3zWz2YOHRzi3XU0sPG5n6KGowLatC9pjZ1VGGT7JPU+yU
         fth8PdiYLq/ZFPx5/cJLTA6DVa4szXA0CciyCrC8S4d1TP/SYeR65HNgMzxvGPxkkUOX
         +NC6DSU6W0YrkqUEB9SJAp0bzJLGjjFlySdIhUlX/G9JVBMaxVFPMtkacOVskGgof+hu
         01onmr2ccUnmFeLiMSPO+ZFWMsaZTM+s1Pg/bSWRHnEJx3wvcPBtKlamWYljVeobWe19
         SWJHmvYoCUyEoaiwCyC38QG+BWiM2IZXMcmoXFVgSAzUXhuoM4+IFje5q7a0EkPtsYUU
         Wcuw==
X-Forwarded-Encrypted: i=1; AJvYcCWy46gp4u0lOsBlYSM/sNN3pAJEIXnJA1TNgkocvky7pOUpVKF3Meci1zfkqefp9FPHwNMTxuT/HxE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGUyuSJ0Cy+EqHlu5TJNNmfGKRTyjNRFVAOGYWqmWAA/aVzEte
	G2yk59GQtVI67gDIfzcc1xJbeTkXuhvLQ8TAw5UKfmJFOLj16o7Q0n+6/KIdYLUJVWCqhEz9Tlr
	JsJLY7m50gEgU5XdnhbK9lKFqf9NSepxUUhpNqbx7qA==
X-Gm-Gg: ASbGnctQrTgvhWk4QbCcEljJGKgypWvn7mamUOFwpZeHyuFN7Aezzfv2MQId2iOjMIx
	/dEkFAxs0hlUM69zvFjR0BITbohYXjpWyi/BsQzTWaehJ4pR4HXAk3lZF+p7dzEYV+jDuYCMl/V
	rJIDuUkAS20WFiPYkFtbueNbOgO//2p0YNje5ovO6xAYxbW/fHHFXvM8t6
X-Google-Smtp-Source: AGHT+IGsWzTP6/gbvQ/CA0ejRIYXVE3ACO/w0NVroX/xY0eGzRwP6PYHlp4erxCJ+zZG6ZfDl+/adXC35SQaJWcaE8g=
X-Received: by 2002:a17:902:c405:b0:235:e8da:8d6 with SMTP id
 d9443c01a7336-237d97c3b5bmr151787145ad.2.1750587120557; Sun, 22 Jun 2025
 03:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250620091720.85633-1-luxu.kernel@bytedance.com> <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
In-Reply-To: <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Sun, 22 Jun 2025 18:11:49 +0800
X-Gm-Features: AX0GCFsb818yKyl7dINvhKYBkJJnEFckaB0ZfIHP1lNH7P09XFDmloWPadWx7s8
Message-ID: <CAPYmKFvcnDJWXAUEX8oY6seQrgwKiZjDqrJ_R2rJ4kWq7RQUSg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_031208_287631_230564A8 
X-CRM114-Status: GOOD (  12.59  )
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

SGkgUmFkaW0sCgpPbiBGcmksIEp1biAyMCwgMjAyNSBhdCA4OjA04oCvUE0gUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gMjAyNS0wNi0yMFQxNzox
NzoyMCswODowMCwgWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Ogo+ID4gRGVsZWdh
dGUgaWxsZWdhbCBpbnN0cnVjdGlvbiBmYXVsdCB0byBWUyBtb2RlIGluIGRlZmF1bHQgdG8gYXZv
aWQgc3VjaAo+ID4gZXhjZXB0aW9ucyBiZWluZyB0cmFwcGVkIHRvIEhTIGFuZCByZWRpcmVjdGVk
IGJhY2sgdG8gVlMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5
dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiA+IEBA
IC00OCw2ICs0OCw3IEBACj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBCSVQoRVhDX0lOU1RfSUxMRUdBTCkgICAgfCBcCj4KPiBZb3Ugc2hvdWxkIGFsc28gcmVtb3Zl
IHRoZSBkZWFkIGNvZGUgaW4ga3ZtX3Jpc2N2X3ZjcHVfZXhpdC4KCkkgb25seSB3YW50IHRvIGRl
bGVnYXRlIGl0IGJ5IGRlZmF1bHQuIEFuZCBLVk0gbWF5IHN0aWxsIHdhbnQgdG8KZGVsZWdhdGUg
ZGlmZmVyZW50IGV4Y2VwdGlvbnMgZm9yIGRpZmZlcmVudCBWTXMgbGlrZSB3aGF0IGl0IGRvZXMg
Zm9yCkVYQ19CUkVBS1BPSU5ULiBTbyBtYXliZSBpdCBpcyBiZXR0ZXIgdG8gcmVzZXJ2ZSB0aGVz
ZSBjb2Rlcz8KCj4KPiBBbmQgd2h5IG5vdCBkZWxlZ2F0ZSB0aGUgb3RoZXJzIGFzIHdlbGw/Cj4g
KEVYQ19MT0FEX01JU0FMSUdORUQsIEVYQ19TVE9SRV9NSVNBTElHTkVELCBFWENfTE9BRF9BQ0NF
U1MsCj4gIEVYQ19TVE9SRV9BQ0NFU1MsIGFuZCBFWENfSU5TVF9BQ0NFU1MuKQoKVGhhbmtzIGZv
ciB0aGUgcmVtaW5kZXIuIEkgd2lsbCBoYXZlIGEgdGVzdCBhbmQgcmVzZW5kIHRoZSBwYXRjaCBp
ZiBpdCB3b3Jrcy4KCj4KPiBUaGFua3MuCgpCZXN0IFJlZ2FyZHMsClh1IEx1CgotLSAKa3ZtLXJp
c2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
