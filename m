Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2547BC7115B
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 08:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXM7ocVaIEnMy+goevhzA1AVHpd4W6lI0HbGcOfRNJU=; b=1hPJ8DNPxDBOk/
	g6yBkRRJGXcdx5tyUjoDU49AwtBCSn+R6uIKRHUEHdKoL1DQiHECE/w0dNSGEju1dxBK9fthdSjD2
	E2NGwjM4shNOYTz9ezKX9/vQ62HA+zGNNJnpj5tNEGCjjtBIBWLshKavoKtIviS25Ll4VqclBc5xJ
	lrji207hCIZOxWpxSCUZO0f9aJ1FcGRirYTRz5a1y/2ga0VjQVkiUCfMZd78obe/vGCyqKK+k4see
	+vGZvxCcQPlSz87E+Ga+cRIzGc4DQC7VowZIQI2PPgspuDqetu4EaPIe3Vx/swNxiNVa1jOAE2W/4
	9gvzdewBK0jIyKjxlIEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcC5-00000001xVN-1fsq;
	Mon, 23 Jun 2025 08:06:21 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcAk-00000001xIe-1Mzs
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 08:05:00 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-23633a6ac50so53045335ad.2
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 01:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750665897; x=1751270697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vmYNde3494s1oZAkDWHVWSrNdQuXQcEtL0WwaKvH1w=;
        b=eBjJlCzR7K57caqxVjZz1GekKgYXnEDQi+rah7L1yvoyfJG90ssmFj8woxCCf0+NFL
         I8PZ2b/qk0ZUtBHnQtIWIRqccyrZhFOuttNfocLJEXutxFmzBxMxmNcKZlFF39aiOaFj
         art0M7QAanyjMaz73bcQ8m9S+mw3gYdsvhXBGlUjSUq8MuFGiA+zjJ6phkylvLU4wHJ8
         MqhrGgSXUuMKBkdxYysdlRM/tB1vPFnEMoJogq6AYCdqNPBVyNXlgit/H2wsQ1c5Ma6c
         Mmv3a10Uy3hfLdOBVfmWbrN0FjQOHzakkOc44mlgOhpZwj/ZPhumprblpcbLET2x4CLq
         FNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665897; x=1751270697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vmYNde3494s1oZAkDWHVWSrNdQuXQcEtL0WwaKvH1w=;
        b=PrFQHDoZfq1BpxQZXw9KO4Tb8K+VgzR8ismRmH0SOb5EfFq6zw60KI+2EMeFOap30J
         wQ5/m4IEy9S8TdiSojVVl3cnSyW3Wy8Igwq/arKvsCUrvn/nGDYrVbkYgRMXoGv8XWnI
         p00b7n0ij4s6vAAHPg+Xzkgm8i/vtgn5QmDoADvBJjqcmZtfzxwLBSu6xKUImc53g0nv
         MnuBjX5VPOO9punLqjdRJuGgmbCmbMCYhkppE2EuDpQii4BjK8rw6MMrutnFuMouDjh3
         0yAeBNzFzPIe5U/VbJa3tgnB/MrlQXw58CFh3S2uWE2Bw9PkC4JYRKFuL+Oj/Bi7oasx
         qmyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNlke7D4aztERKcXl8JM8cUp+gdfERqrAqMQ7+fGe3UqUp8KiTlVLnm7cdXMqgzJGMOWBVFxtvAjE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrk4XsjS0Mxg0rmx5uGEciSaSclG37PuM96DOPOn8FC2EXgzMs
	xX5grkJuGab4rGN0JY0kBzBlSTO0+W9oFcMr1fTfxmyT0kjzRsfDCSdfwCyth8bM+BKF1rKbBlN
	sFythPaM=
X-Gm-Gg: ASbGncurAzn68z8OamsPK9kPIlXHqEYtRDlpwSH9+yUqUqGTdX1Ufnbec6VvOX1pO/P
	TZ5/vU/RYdsKcfJTiJGHVjpkShQYEEaRyw36ZzTLiXVKCPX3XKngb5YYbMt4rIQb0C6d4647kxN
	VKweMVXUyL/v6+daf6nOIWI8bDV4gkAWvIK5nFrkQevXX0IP7QlY65iVhSvV0zE9NYTsU3Vt7uC
	qe5FVGuzxlcNHYVJlAh/5/QvEfrS5J0+SOIrhLhf9A5BG2iP6cM+fZx6Vl6YJUvNXRRiC9pyTvy
	fPZXbjHt95674QgYxbiVjqsUqic0jpi2uipFaVAWV+TkS2g9/cOzykUQaeNObzE3Rtae3nMolEy
	YQLjB0GzSXCA1UI1uM9cPpFZ2jSE76TQ=
X-Google-Smtp-Source: AGHT+IGAu8sRN9d6YginLzXnR26SBrwXTWtMoIeqalY4gdd+wB4xJaqi8iWblIrCKepqAoQGghGYIw==
X-Received: by 2002:a17:903:4b30:b0:234:8c3d:2912 with SMTP id d9443c01a7336-237d96b6361mr175973175ad.11.1750665897172;
        Mon, 23 Jun 2025 01:04:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d867f8d0sm78007835ad.175.2025.06.23.01.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:04:56 -0700 (PDT)
Message-ID: <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
Date: Mon, 23 Jun 2025 10:04:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Xu Lu <luxu.kernel@bytedance.com>, anup@brainfault.org,
 atish.patra@linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_010458_472107_7FE979ED 
X-CRM114-Status: GOOD (  10.48  )
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

CgpPbiAyMC8wNi8yMDI1IDE0OjA0LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gMjAyNS0wNi0y
MFQxNzoxNzoyMCswODowMCwgWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Ogo+PiBE
ZWxlZ2F0ZSBpbGxlZ2FsIGluc3RydWN0aW9uIGZhdWx0IHRvIFZTIG1vZGUgaW4gZGVmYXVsdCB0
byBhdm9pZCBzdWNoCj4+IGV4Y2VwdGlvbnMgYmVpbmcgdHJhcHBlZCB0byBIUyBhbmQgcmVkaXJl
Y3RlZCBiYWNrIHRvIFZTLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBYdSBMdSA8bHV4dS5rZXJuZWxA
Ynl0ZWRhbmNlLmNvbT4KPj4gLS0tCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPj4gQEAg
LTQ4LDYgKzQ4LDcgQEAKPj4gKwkJCQkJIEJJVChFWENfSU5TVF9JTExFR0FMKSAgICB8IFwKPiAK
PiBZb3Ugc2hvdWxkIGFsc28gcmVtb3ZlIHRoZSBkZWFkIGNvZGUgaW4ga3ZtX3Jpc2N2X3ZjcHVf
ZXhpdC4KPiAKPiBBbmQgd2h5IG5vdCBkZWxlZ2F0ZSB0aGUgb3RoZXJzIGFzIHdlbGw/Cj4gKEVY
Q19MT0FEX01JU0FMSUdORUQsIEVYQ19TVE9SRV9NSVNBTElHTkVELCBFWENfTE9BRF9BQ0NFU1Ms
Cj4gIEVYQ19TVE9SRV9BQ0NFU1MsIGFuZCBFWENfSU5TVF9BQ0NFU1MuKQoKQ3VycmVudGx5LCBP
cGVuU0JJIGRvZXMgbm90IGRlbGVnYXRlIG1pc2FsaWduZWQgZXhjZXB0aW9uIGJ5IGRlZmF1bHQg
YW5kCmhhbmRsZXMgbWlzYWxpZ25lZCBhY2Nlc3MgYnkgaXRzZWxmLCB0aGlzIGlzIChwYXJ0aWFs
bHkpIHdoeSB3ZSBhZGRlZAp0aGUgRldGVCBTQkkgZXh0ZW5zaW9uIHRvIHJlcXVlc3Qgc3VjaCBk
ZWxlZ2F0aW9uLiBTaW5jZSBzb21lIHN1cGVydmlzb3IKc29mdHdhcmUgZXhwZWN0IHRoYXQgZGVm
YXVsdCwgdGhleSBkbyBub3QgaGF2ZSBjb2RlIHRvIGhhbmRsZSBtaXNhbGlnbmVkCmFjY2Vzc2Vz
IGVtdWxhdGlvbi4gU28gdGhleSBzaG91bGQgbm90IGJlIGRlbGVnYXRlZCBieSBkZWZhdWx0LgoK
VGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gVGhhbmtzLgo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcg
bGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
