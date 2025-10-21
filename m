Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B886ACCD184
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 10:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9egX61oNk8zh4yuo5GCiFsZODEcA03pvOvFxx8uvWQg=; b=i8Zu4P4t5WniXk
	6rXp1DyrXaYkObm+VQE3DolAvBmRABWqwdLe1j+3nuivyPvMKAL0UjjWOYlpSsHVriYkbPrb9qBRu
	NFuIPGxzR/c6lL0LxAzC/Eij0qRrGPiCmzYUut8Qy9B5bGYKfG//nBL5CPyhVYA2ko6bjaoSF0pRj
	npUfimoyTNqJzdDriCEGmfRxK8aznARG5i8aCzK+v29IZZsSB7cHE4GwWjrjPwnWZ4MTGhCIwDFMu
	qlorGpF2M4YetYTDPVdkVf8528PAKiEPKHZ2gKQJfoSljzile24/eBNWHkNPp35QfXS1h3+GDHJK/
	pKZ0XXevo6cYfWFlJ3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9Lr-0000000Ga0b-1QEz;
	Tue, 21 Oct 2025 10:12:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9Lp-0000000GZzw-3itM
	for kvm-riscv@bombadil.infradead.org;
	Tue, 21 Oct 2025 10:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lS7BlA3ltA1K+OuXFELUMAx/9ayEMieaqVJ6yEPITIo=; b=nZaBA5UQGAuEoaWqdy2zedW34o
	ssTjTAJLcfGyVYTejBOd1kELT/Rh7a+BicgwlOpY+Y3OA2eSQ9y7BOhy7hRu+EC+VL+TdMOwfCAwl
	W5jgBP5oHSO4JMDFBpwKdOBFQ1XglyuC1MiF+IxU/bWF0hFya02xpMWYXPx6CNomIxiNr5vh1QlQj
	okEnCCKeLSdxnv0nJAM4tuxr+8E+B9Ay69O/KpTYi6jTrZbv59iFbsnvFtqS8q+QAA/M0FCAeOKjb
	Myu+Eo9517jeheW15qXnBt+7/uB+yEr84zTtG5kJ+6VQ9DxYbRFWrr7rf0rWf0M9Y35G7gtch4gAC
	Ng4qsI5A==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8U5-00000000fCI-0pHC
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 09:16:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-46e610dc064so866365e9.3
        for <kvm-riscv@lists.infradead.org>; Tue, 21 Oct 2025 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761041535; x=1761646335; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lS7BlA3ltA1K+OuXFELUMAx/9ayEMieaqVJ6yEPITIo=;
        b=UxUwgRYY8RivW8/thDa/Em+hBQ5CuAHM413k/ZkyEGBSGlL/5Qy2LCh10aEHi0bIzm
         NagFVGPr1NcOQN1IGUcPH60uMtIouF/LxU6egghOP5FP35jNCQ2BCg7IdF5zmrQNsEQ8
         gaHtIx9Lq8PzQ/i1yPA54xycXL6gB2EhGvl/QmgAZWNh19JBEf73GB1S4Xz8qogfNLOz
         Pe7IFpSlj1upfXNIqqacP5NQbcnidfQOijeod3pd/H7Jc0eS3HT1N+YWk2HIRFrKNpAO
         I7DvdBHYYjXI8LsSiiNprpLIT3/zUTSAEst/DiNQvQvlp6joz3EXscsAA7r9LEjFFyFH
         4Z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761041535; x=1761646335;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lS7BlA3ltA1K+OuXFELUMAx/9ayEMieaqVJ6yEPITIo=;
        b=w7cTybx5Q9dmFDLHOljyA1jvgGdwfDMwAcsaVLEKl/BgGjhnFobWbB0E6xQ3WqdUSG
         XqqYrgtVpDp6VxOAtDg0pwGAmYB2pEDqUyX7seGwhkVrP7YmRAV5yB5ZLpd6DeYFDqFT
         pOPbNLrG4zJHsva0Th4eGUTL63UYvKxvFIEDNu02CgFcAQEUUYAV1S8CxI+l9qEVz3kq
         2JzzzgnaoTKtcp4/NjWfT+6oN3iUGn+fTSO+e+XwuKVsHndh/AelPDL3uamyJW1+MpSk
         EXAD07aQ30g4Z/uFMB3vr03IS+b170T9dmjPGezs2R90IPoIrbgLTz8mZMT4wyeWQtzS
         XEBA==
X-Forwarded-Encrypted: i=1; AJvYcCUOCNfwoD6ROsvUtZ9HH7CTxhJ9n1Sc8iVKUt8Y88j0gXszwXZtStXDJpea6SKLzqx0QD5En2BUv0U=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbwCtaN4chnTsgZtudxBONjxQcdUVoJbserExCkaBrCq6altZ9
	TTstXFywzlhReL9s6tayYX+hCTRVPakdLxkljYAuByJqGo3FdlJX9W7+G8X6J5aEJ+o=
X-Gm-Gg: ASbGncuT95I7AveihPc+ONFbulow9U96DivyMnLV9sLnvu5cwaUGIPGTAOvyUlqa2ca
	2oFKDnhs1TEGuUWpUASrTzSTAlCFocdN7rg5iX2oLXPi9mtpxTz77MKz8x7QKwN81mDRaTHhst4
	2JlWuZFApX/mHi2ldmdRe5z78SgYciaJJ5kZW+8YL32XZz2nQLzE9zLIa14RVA5SKCm7eXzrRx0
	9L9Q/8VzL5scqf9+sg+25uL4M06P6xVnRWvtDGEZfNb1/KuHvSJ2lHpIJCWK+byHkrDyOtv/Sdx
	86B29A64kE3BcespNqOaBmUHAR7QPPNap/tq/GUxgaGQnmKI0is/ZCcVdvrQ4nvtTOQ3RSLyWvp
	eH2hwbR8c0BTWT4fPAsSebOIulqfIrUVXnx9Y+HL4UG/Tl6QstObxgrCQENwMAxAqmspoiqJf08
	k=
X-Google-Smtp-Source: AGHT+IGMp04zmiOU/hD8LCGYBTUQQCGASEAZAsC4+kzM41lFqGtljB8ajxnMiIjuotYviMNMQl6Bbg==
X-Received: by 2002:a05:600c:6308:b0:45d:da49:c47d with SMTP id 5b1f17b1804b1-474941ec4b9mr10454745e9.0.1761041535023;
        Tue, 21 Oct 2025 03:12:15 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::bfbb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4715257d90bsm189405475e9.2.2025.10.21.03.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 03:12:14 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 21 Oct 2025 12:10:47 +0200
Message-Id: <DDNX3CCBLWXK.3KMVX9AKL162N@ventanamicro.com>
Subject: Re: [PATCH v2] RISC-V: KVM: flush VS-stage TLB after VCPU migration
 to prevent stale entries
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <tim609@andestech.com>, <ben717@andestech.com>, <az70021@gmail.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Hui Min Mina Chou" <minachou@andestech.com>, <anup@brainfault.org>,
 <atish.patra@linux.dev>, <pjw@kernel.org>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251021083105.4029305-1-minachou@andestech.com>
In-Reply-To: <20251021083105.4029305-1-minachou@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_101650_116155_9BA4A285 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

MjAyNS0xMC0yMVQxNjozMTowNSswODowMCwgSHVpIE1pbiBNaW5hIENob3UgPG1pbmFjaG91QGFu
ZGVzdGVjaC5jb20+Ogo+IEZyb206IEh1aSBNaW4gTWluYSBDaG91IDxtaW5hY2hvdUBhbmRlc3Rl
Y2guY29tPgo+Cj4gSWYgbXVsdGlwbGUgVkNQVXMgb2YgdGhlIHNhbWUgR3Vlc3QvVk0gcnVuIG9u
IHRoZSBzYW1lIEhvc3QgQ1BVLAo+IGhmZW5jZS52dm1hIG9ubHkgZmx1c2hlcyB0aGF0IEhvc3Qg
Q1BV4oCZcyBWUy1zdGFnZSBUTEIuIE90aGVyIEhvc3QgQ1BVcwo+IG1heSByZXRhaW4gc3RhbGUg
VlMtc3RhZ2UgZW50cmllcy4gV2hlbiBhIFZDUFUgbGF0ZXIgbWlncmF0ZXMgdG8gYQo+IGRpZmZl
cmVudCBIb3N0IENQVSwgaXQgY2FuIGhpdCB0aGVzZSBzdGFsZSBHVkEgdG8gR1BBIG1hcHBpbmdz
LCBjYXVzaW5nCj4gdW5leHBlY3RlZCBmYXVsdHMgaW4gdGhlIEd1ZXN0Lgo+Cj4gVG8gZml4IHRo
aXMsIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9zYW5pdGl6ZSgpIGlzIGV4dGVuZGVkIHRvIGZsdXNo
IGJvdGgKPiBHLXN0YWdlIGFuZCBWUy1zdGFnZSBUTEJzIHdoZW5ldmVyIGEgVkNQVSBtaWdyYXRl
cyB0byBhIGRpZmZlcmVudCBIb3N0IENQVS4KPiBUaGlzIGVuc3VyZXMgdGhhdCBubyBzdGFsZSBW
Uy1zdGFnZSBtYXBwaW5ncyByZW1haW4gYWZ0ZXIgVkNQVSBtaWdyYXRpb24uCj4KPiBGaXhlczog
OTJlNDUwNTA3ZDU2ICgiUklTQy1WOiBLVk06IENsZWFudXAgc3RhbGUgVExCIGVudHJpZXMgd2hl
biBob3N0IENQVSBjaGFuZ2VzIikKPiBTaWduZWQtb2ZmLWJ5OiBIdWkgTWluIE1pbmEgQ2hvdSA8
bWluYWNob3VAYW5kZXN0ZWNoLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBCZW4gWm9uZy1Zb3UgWGll
IDxiZW43MTdAYW5kZXN0ZWNoLmNvbT4KPiAtLS0KClRoZSB2dm1hIGZsdXNoIGlzIG5vdCBuZWNl
c3Nhcnkgb24gaW1wbGVtZW50YXRpb24gdGhhdCBoYXZlIGEgc2luZ2xlIFRMQgpmb3IgdGhlIGNv
bWJpbmVkIG1hcHBpbmcsIGJ1dCB0aGVyZSBpcyBubyBnb29kIHdheSBvZiBkZXRlY3RpbmcgdGhh
dCwKClJldmlld2VkLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNv
bT4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
