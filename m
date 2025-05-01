Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FA9C369DC
	for <kvm-riscv@archiver.kernel.org>; Thu,  1 May 2025 13:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjnn3DPj0IYmZJqklT6FJ0HlZqxda3E9iSdo8ERTkvg=; b=BG2/UGXjwobINy
	DpjWZ/CTCzU/gKzkmaT90RI/sHNOUodNl3puCa/AFGIRckUULccl9111ewrJeVlecEW4YOA7fg41w
	E0oalLl1nOjU/agIv5fc8z0tPeMZxXjwdfQWloSSf+4ETyz1GrlsswJI+Ok6xqsVIJLHxCnoJLqHp
	SaGL9cScDsMQK/Ahc2LR3XoU+bZ5yArBsYl5NC4wDAwrF4amr54wX2VIJARJkQbf78BIqnHl5XRw2
	p3kZOqVa1tzIQkc4D89zXI5lj3MiOqOFUz6JMveJNiKMwBOghPvaBjq2Y1MkX4Kci4+LcPRkgoLp9
	pESasrARyKPbHYpDqgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAU9x-0000000Fr3k-16h0;
	Thu, 01 May 2025 13:41:05 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAU5K-0000000FqDG-0imP
	for kvm-riscv@lists.infradead.org;
	Thu, 01 May 2025 13:36:19 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d5e68418b5so9494195ab.2
        for <kvm-riscv@lists.infradead.org>; Thu, 01 May 2025 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746106577; x=1746711377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5HbFwwkJF2Y2R1Vbj0ljcnhgzUV/rgTcfz1KnrFhCo=;
        b=IYKefz6KPpfmBmjDkm+mrTcE4qn76UuaDWKuJ3eDM+qpUy+LXXU6Z7T3ErJfw9ej8o
         accQ0S+Bb4LZCPJk7sj4fOwdJXrNGHqdBQZkkALUoh9p8ToyOozV0y7tkGZLN7jBehta
         S7zG4UZE/VgA4H/+hiBJ9jGXc0tuPxOf1mtuE0vmwnSjsGIAJD/ohGB2XikdKSvCfKGR
         lmXr7wDn5C10ci9P3cqs6COGCLkleB3m/TXlzPbyS51yggZNwq+aNYOGUmKaIx+434d0
         dtkZJxrg9FgA9ekbTRL/pWNAgsJp6iSXz4hQ68CTP/5QjD+rmNxztRIoLCuHEGWtA/qx
         nNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746106577; x=1746711377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5HbFwwkJF2Y2R1Vbj0ljcnhgzUV/rgTcfz1KnrFhCo=;
        b=s2EjC3boQn/kQUEjRzaEIdnOyKcWYegHDSqhPfqMM9K0AE/iDj+0MmgsiT43MVSd1J
         lhlIV5deO+ygdfzdLMWQRNelq4otrtcRYpJmza8tu246XPcdzR9EJDl1Svwx/g+9oqyB
         /1BEYfHGgaJU1x2REu03bzlHNsLoWLq3ITJW1scMaQCwy9RAb39bgmTi+7cX8lQ0PzeQ
         UgrWJY+Nz1/LFQPkMe7q3Lqf4tBMUyhny7KT0iGnW72mdis+Ptlb2GholBtqh+DXiyek
         qZLMf3xzqOiCIakzFSk5jMd6RvGaqRlHxXlqoqvp+BE2Qz4m7Yn3IVJRRo42Z8MRn/ia
         c0nw==
X-Forwarded-Encrypted: i=1; AJvYcCVs/LfeatC5MX/1/jq+mBcepp+je6e/IXNtsyMfwV0AS67AjpZdTm42A+Jd9Z9SyZqjgWRnR4cW2iY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnMdYhbRXElQReLPSbVGZL+idhUiW0lymLkTPwi4+gsdWfwQmU
	umGsHK6YcFW1ybO62j79QrdW7ev0e44y4YiLSifAN0c/DUoYqEVN0ELx78POgAz0A+DyAa8uLFI
	w9UtubcX8K52ixI44609BQk3TjDnp1faKVyn9SQ==
X-Gm-Gg: ASbGncu/Xa1IeIt1k4fRB8YMEi4qA9dEzcmcxiGxbA9u72iN4Ps26DfUbINm+wksbLC
	qUBgVoLiXJkQci06c9wfGpX7YxpzXUb86V4rWS0xGfi2pU2uXIUySF6mrABqF+a12MsnIVRr2PM
	AfBiNmhvhalxKYwAIe9IYZDQ==
X-Google-Smtp-Source: AGHT+IHY7gd5DfteiMffTuTR2BB5tAOFnK6ac9kV3ASNuI57T6S+/lfY0TuUH0M3Tjf2aq1tEUdaJ7qOsG8AOHYTWno=
X-Received: by 2002:a05:6e02:1b0b:b0:3d5:eb14:9c85 with SMTP id
 e9e14a558f8ab-3d9676c6669mr79049245ab.6.1746106577095; Thu, 01 May 2025
 06:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
In-Reply-To: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 1 May 2025 19:06:06 +0530
X-Gm-Features: ATxdqUElPYmtqqRS47Feed2BMb796DJHZOR_NiIu4niYbEKvJ9Q_aHmmUyE0IV4
Message-ID: <CAAhSdy0UAnmNHWNJBysuH93Mok5_AQB88uy0nHuiumpfGgiJfQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] RISC-V KVM selftests improvements
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_063618_211281_FDC4824E 
X-CRM114-Status: GOOD (  13.74  )
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

T24gV2VkLCBBcHIgMzAsIDIwMjUgYXQgMTo0NuKAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGltcHJvdmVzIHRoZSBmb2xsb3dpbmcg
dGVzdHMuCj4gMS4gR2V0LXJlZy1saXN0IDogQWRkcyB2ZWN0b3Igc3VwcG9ydAo+IDIuIFNCSSBQ
TVUgdGVzdCA6IERpc3Rpbmd1aXNoIGJldHdlZW4gZGlmZmVyZW50IHR5cGVzIG9mIGlsbGVnYWwg
ZXhjZXB0aW9uCj4KPiBUaGUgZmlyc3QgcGF0Y2ggaXMganVzdCBoZWxwZXIgcGF0Y2ggdGhhdCBh
ZGRzIHN0dmFsIHN1cHBvcnQgZHVyaW5nCj4gZXhjZXB0aW9uIGhhbmRsaW5nLgo+Cj4gU2lnbmVk
LW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gLS0tCj4gQ2hhbmdl
cyBpbiB2MzoKPiAtIERyb3BwZWQgdGhlIHJlZHVuZGFudCBtYWNyb3MgYW5kIHJ2MzIgc3BlY2lm
aWMgY3NyIGRldGFpbHMuCj4gLSBDaGFuZ2VkIHRvIHZjcHVfZ2V0X3JlZyBmcm9tIF9fdmNwdV9n
ZXRfcmVnIGJhc2VkIG9uIHN1Z2dlc3Rpb24gZnJvbSBEcmV3Lgo+IC0gQWRkZWQgUkIgdGFncyBm
cm9tIERyZXcuCj4gLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUw
NDI5LWt2bV9zZWxmdGVzdF9pbXByb3ZlLXYyLTAtNTE3MTNmOTFlMDRhQHJpdm9zaW5jLmNvbQo+
Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIFJlYmFzZWQgb24gdG9wIG9mIExpbnV4IDYuMTUtcmM0Cj4g
LSBDaGFuZ2VkIGZyb20gZXhfcmVncyB0byBwdF9yZWdzIGJhc2VkIG9uIERyZXcncyBzdWdnZXN0
aW9uLgo+IC0gRHJvcHBlZCBBbnVwJ3MgcmV2aWV3IG9uIFBBVENIMSBhcyBpdCBpcyBzaWduaWZp
Y2FudGx5IGNoYW5nZWQgZnJvbSBsYXN0IHJldmlldy4KPiAtIE1vdmVkIHRoZSBpbnN0cnVjdGlv
biBkZWNvZGluZyBtYWNyb3MgdG8gYSBjb21tb24gaGVhZGVyIGZpbGUuCj4gLSBJbXByb3ZlZCB0
aGUgdmVjdG9yIHJlZyBsaXN0IHRlc3QgYXMgcGVyIHRoZSBmZWVkYmFjay4KPiAtIExpbmsgdG8g
djE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAzMjQta3ZtX3NlbGZ0ZXN0X2ltcHJv
dmUtdjEtMC01ODM2MjAyMTlkNGZAcml2b3NpbmMuY29tCj4KPiAtLS0KPiBBdGlzaCBQYXRyYSAo
Myk6Cj4gICAgICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBbGlnbiB0aGUgdHJhcCBpbmZvcm1h
dGlvbiB3aWh0IHB0X3JlZ3MKPiAgICAgICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IERlY29kZSBz
dHZhbCB0byBpZGVudGlmeSBleGFjdCBleGNlcHRpb24gdHlwZQo+ICAgICAgIEtWTTogcmlzY3Y6
IHNlbGZ0ZXN0czogQWRkIHZlY3RvciBleHRlbnNpb24gdGVzdHMKClF1ZXVlZCB0aGlzIHNlcmll
cyBmb3IgTGludXgtNi4xNi4KClRoYW5rcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
