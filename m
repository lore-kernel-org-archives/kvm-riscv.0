Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F05C5B549
	for <kvm-riscv@archiver.kernel.org>; Fri, 30 May 2025 11:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=db53BliaFnguz/1ozXufDCiVneRRuPqFLcoV8cairDc=; b=ZyqLiMpgEWEZ+S
	DTF6ufYv2kVwYeGTOMJqplJNwkTwvlCq8Z6cCvZ+wWeIC2VUpY+v2h2eB7sFHPEuZHg3tOFf9kqpO
	QhgEuqw5lC/gE4KfLwBb9ynbhgUN92E61MLwmL4OluVPspJeFMMrFHl0wWv5ZUn3GV3s3psPatcjw
	cQJxn+sTFBfQlyLpERy5SfWMuS4PNFow3d4s18Yy/x0fpIUQui7jWp2Xu657SJzyY+dirO2qrFntc
	0J9fyGqXYrYspU5Ea0mvAoV3Qfb0J2InJcONKoZ74hmkA4hGQxoY8VkCP+71zZAuzF7ALxpVq5iIf
	ZMqtDmu0Rk/AhCvdDsaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxcT-00000000MPn-2H47;
	Fri, 30 May 2025 11:09:49 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxcQ-00000000MOL-3DxV
	for kvm-riscv@lists.infradead.org;
	Fri, 30 May 2025 11:09:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so338505f8f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 30 May 2025 04:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748603385; x=1749208185; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKHlHU74s9id5ECnlxromIqBTzfUbM5l+HheDzzqFcg=;
        b=K/NIuDq71XG/rmc5YIhJVSgPT780dd2E1irmLc5qW9HGz9I1RRgPrak8Voy/puaUQc
         mYxKWXaPyNTew5V/lK6N8vjk3Setc67PmcVyWms203mCBTO4guBXMDmq4B6JZwCkWtiJ
         OWUWatd+kK4S55RfBtg/4mr1x/i9zSrIjhikCcJax544QspzVHY4I6r19HfAs7ofQM4q
         zCO0nqSu2LF9AzaDqm+nvmh3l+aCTYzS8jl4on7NRM0flamlDqyKvLMXDP4DOKVGJw76
         6zQAOvucgvbKuBuvN2JXMDaJCsUT/NjPlAOjtmAvxyENJRPPNuVe8CkJCYEMYdOkFyam
         taJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603385; x=1749208185;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nKHlHU74s9id5ECnlxromIqBTzfUbM5l+HheDzzqFcg=;
        b=hnBNb9o18hTH4VLvXNoX+xKz21SBb7kgODX9mwchb3Iz+hK2iJ+iTHJXdOU+MPjFE7
         wxmt/ofqJ67s8+f474j84GbBe7u6rAnRCRPo+TQ0Z7N9NdSs2i5dW8FsBV1Yej221cD1
         q0IYr9ZpKY8fyRmZlaghSogguqwPhkMsQGeTiT9PDG6Z+fYKMANKwXd2P/kPKLao8nEa
         JZbFVLtaa9htEQ5Gt4nhCrh7bU49XU5BCNOpep7CwEfISlsEGha8qIKlk1YTBh83ne82
         gqTLVwlWU8guzoq1qfz/zpDi5x9KCgzGD463o/81Xe3d0ZWNSEiML5gPEpsxXBUzfLJg
         +3cw==
X-Forwarded-Encrypted: i=1; AJvYcCXPIjtq0g+w9SmswNZqjnr4pbhNNYZeKjvE0xDmzq9zJyYXyhnm8EUlKwH0+1dw/AsuOh2URTHbO8w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8InZMlEvVO3wPAhPP/vZrZSxC1dKM0Eb/5zs/XJhzvQ1S7lvT
	xTLPzjsDSUbjOKMX/LOFaxVCYEqkzM3OFtPG0jaelkbQ9IE66z3a1CU860SuBHxfIwU=
X-Gm-Gg: ASbGncsK921vi9D2V4yJEw+64nhWOjzMKCQrePudV62ZOabununsnxaDe+3KIXsza7D
	HWa37+WC+jgDtf9dEqHGlwmYDyKHdLVOGJlQAxj2CbGeY+mFaHhlvbZ+8eSyelZOElhOxH8qT+9
	LfFLg0r+foO32O96ZAW4r8/kOPV2zwo/BJRYtrWwDWcKf5GthFwfIm6qw70HrLY1V2bZIEisdGf
	r6tsWRUnHUYH50a+S5YtGYqykZHf9SSfPHewuPhZempVLWuKiMnha3pMSOzzs1HALdIzc6JAbZy
	lCn+n7XToNV8YuZl/b27Y6OtUR2FHSALCSgyec3qaW+qFYHWZA76nhBJhrM=
X-Google-Smtp-Source: AGHT+IHWlRXsHj8fy3YljEwKBbucuDh540moRSz1XXe7HUhMOymhGLaK6eZjYnDZtJV/6QwPDY4NXA==
X-Received: by 2002:a05:6000:228a:b0:3a4:dbdf:7152 with SMTP id ffacd0b85a97d-3a4f7ab6c2fmr730169f8f.14.1748603384676;
        Fri, 30 May 2025 04:09:44 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:23dc:ac4e:5f79:355b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972c1sm4593368f8f.68.2025.05.30.04.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:09:44 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 30 May 2025 13:09:43 +0200
Message-Id: <DA9G60UI0ZLC.1KIWBXCTX0427@ventanamicro.com>
To: "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
Cc: "Anup Patel" <anup@brainfault.org>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Mayuresh Chitale" <mchitale@ventanamicro.com>,
 <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
 <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
 <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
In-Reply-To: <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_040946_810949_58B8F81A 
X-CRM114-Status: GOOD (  10.81  )
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

MjAyNS0wNS0yOVQxMTo0NDozOC0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4
LmRldj46Cj4gT24gNS8yOS8yNSAzOjI0IEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+IEkg
b3JpZ2luYWxseSBnYXZlIHVwIG9uIHRoZSBpZGVhLCBidXQgSSBmZWVsIGtpbmRhIGJhZCBmb3Ig
RHJldyBub3csIHNvCj4+IHRyeWluZyBhZ2FpbjoKPgo+IEkgYW0gc29ycnkgaWYgc29tZSBvZiBt
eSByZXBsaWVzIGNhbWUgYWNyb3NzIGluIHRoZSB3cm9uZyB3YXkuIFRoYXQgd2FzIAo+IG5ldmVy
Cj4gdGhlIGludGVudGlvbi4KCkkgZGlkbid0IG1lYW4gdG8gYWNjdXNlIHlvdSwgbXkgYXBvbG9n
aWVzLiAgSSBhZ3JlZSB3aXRoIERyZXcncwpwb3NpdGlvbnMsIHNvIHRvIGV4cGFuZCBvbiBhIHF1
ZXN0aW9uIHRoYXQgd2Fzbid0IHRvdWNoZWQgaW4gaGlzIG1haWw6Cgo+PiBFdmVuIGlmIHVzZXJz
cGFjZSB3YW50cyBTQkkgZm9yIHRoZSBNLW1vZGUgaW50ZXJmYWNlLCBzZWN1cml0eSBtaW5kZWQK
PiBUaGlzIGlzIHByb2JhYmx5IGEgM3JkIG9uZSA/IFdoeSB3ZSB3YW50IE0tbW9kZSBpbnRlcmZh
Y2UgaW4gdGhlIHVzZXIgCj4gc3BhY2UgPwoKSXQgaXMgYWJvdXQgdHVybmluZyBLVk0gaW50byBh
biBJU0EgYWNjZWxlcmF0b3IuCgpBIGd1ZXN0IHRoaW5rcyBpdCBpcyBydW5uaW5nIGluIFMvSFMt
bW9kZS4KVGhlIGVjYWxsIGluc3RydWN0aW9uIHRyYXBzIHRvIE0tbW9kZS4gIFJJU0MtViBIIGV4
dGVuc2lvbiBkb2Vzbid0CmFjY2VsZXJhdGUgTS1tb2RlLCBzbyB3ZSBoYXZlIHRvIGVtdWxhdGUg
dGhlIHRyYXAgaW4gc29mdHdhcmUuCgpUaGUgSVNBIGRvZXNuJ3Qgc2F5IHRoYXQgTS1tb2RlIG1l
YW5zIFNCSS4gIFdlIHRyeSByZWFsbHkgaGFyZCB0byBoYXZlClNCSSBvbiBhbGwgUklTQy1WLCBi
dXQgSSB0aGluayBLVk0gaXMgdGFraW5nIGl0IGEgYml0IHRvbyBmYXIuCgpXZSBjYW4gZGlzY3Vz
cyBob3cgYmVzdCB0byBkZXNjcmliZSBTQkksIHNvIHVzZXJzcGFjZSBjYW4gY2hvb3NlIHRvCmFj
Y2VsZXJhdGUgdGhlIE0tbW9kZSBpbiBLVk0sIGJ1dCBJIHRoaW5rIHRoYXQgdGhlIGFiaWxpdHkg
dG8gZW11bGF0ZQpNLW1vZGUgaW4gdXNlcnNwYWNlIHNob3VsZCBiZSBwcm92aWRlZC4KCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
