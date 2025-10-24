Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD92CCD1BF
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 15:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLTWQGWvh3mUp9E4q4nA72PnpJ7CgBq4s9AUt6vqL3o=; b=GaUrfdBHrxWbaC
	AY763Jv64o6ISf4b8gY8l8VWYsrdq2rJIT9tDfRu+AjJQoB6mwlS4BUGGk4PSnyIoITxc+asPVs8W
	ZS68qdReptT5N9vnHto7A7QJNT9KoM3CDslXMmGSV57aJVYSQBh+kjqLcxFQWjIyQe8K5eRO3xXTL
	RtgtBDavTAiHDQZSCI6yMvXrFF5PIVLyV4nw5pAWjVzvdI2cezKgIIAjLIkFhOI1qd1axDZ5urmxx
	pT6/PuxCYfJx9zIyBlMNfcmo+kkTqgecuCiucYMBV4+3WyWela8wBgUPztUylTKCRNOKC/lEgAy1D
	AkRS7XxGKdS+77LCLdVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKAL-00000009she-1IbA;
	Fri, 24 Oct 2025 15:57:21 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKAI-00000009sgo-3PSa
	for kvm-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 15:57:20 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-430d0cad0deso10771515ab.2
        for <kvm-riscv@lists.infradead.org>; Fri, 24 Oct 2025 08:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761321438; x=1761926238; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWiGG85ath2jzAlAPFhCB5oiKw5XwqI4VvMQg5Ys3AE=;
        b=Y9H9q75gXnHyQVBoIheHGJGNGiS3OJ78renfWOJLBMuhjz4aHubzzCxUGXZFNh66DC
         OkF5i+e5qmc2HCq2lAxt/7U9j4y+kPhx0YXWux+5UOGoKG2ccn3NGP4F4ZGrAe9dygvV
         4dfX5E0cFn5R0JpvIrCsu4DueYuR404k59LUuEcm2r4DV3LFMrRKE5RTuZlsbfyTBh/d
         gCVlX7dPr57T+donqFNjfktNfdebRDPvwMFUVKRPo1q0uVsXrpvqYh4/ySJ7Qr8abmMu
         /5yWf4yAJFuUT7KNCHolP1/3httDYoLsuJdX7FjrydfopadUEJ4tnNwweYnPfuFT8Zc3
         Jbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761321438; x=1761926238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWiGG85ath2jzAlAPFhCB5oiKw5XwqI4VvMQg5Ys3AE=;
        b=I4VPvOHGyfXJNZ+VMmdSuDCmWGc1eyCxdE4GDLw02N+ErIKSI//HXaYg9PMPgB2x+7
         XbIATedTI+v1FvQPMOK335onP9cc8cZ7aWZW0ZESnIQWIno4zaP+U4/99xMIFiBrBj3n
         qYW7p2JafyZficjRbl9Sy4ef+p21ybmzgjstrUKS/UlDUco5k/Cu37RzihAz4fw36C7N
         gNxCFMhMxoVao69KwUqFQQNTXt1EVrSkSD0Z9Wu0cKi1e0VGg180MG7MJLKqtcfz4pNc
         gW4gRJUcz/svPsAQBq9LYXcQbs/DHrmFs8Jgntzef4vxtlMGYmWQbuUHzaSthxjpsQAc
         lrzA==
X-Forwarded-Encrypted: i=1; AJvYcCWo0KSYhAJCNMp5DhIJUuMInIkBnZxCFXhL4MdyXqcU1jJDZAP2hEemMIncIHx8uERLOyh5IthV31E=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbJHnHmQ3Z2pBnrs4TheTl/5hdHSUkAEb/jzuNDyjjdowM8ixL
	DbWoRm1NdUWd5UDPR23GIIrXDXwk8OZXYdU0i46ckVq+orwerQePNpbLSBvS959LeKdxaHN8V1p
	oMbOktvDqB+vCqHw0L1Hg/dGpC/qtjoO3Hr6CJwkhXILkGbXJoQYygE8=
X-Gm-Gg: ASbGncuxspIqOtxClfzzyczbf8JqKIXnpDkxhZEWUEDqUfG70PSX5nnAh5VoluenI2v
	T7RTYQ7e+VRI0fd478nnesZcuMktstVBpyaXEPojHzUjhIb6DBrB/oqXXpw0XtTgn78gUqJrIF6
	vg0P/DbWJWxb73pefnRcybR+Z7AAfhNGYCuZ1CyP3/yH+Lq834VKLQ1w7E3nldZ1PU1ZgKBCYqX
	PIGEYEarvzEX33f057h3RJnU2Gnpf0PGhNB1trJ8Y+lmm7GqyxlsX3NLnJXh5XFa0xUXofIbMfv
	OOAOCx0Xo4wXvdHs70AsjMedpsgi
X-Google-Smtp-Source: AGHT+IHEWvX0kFGAJ7kHIWxzKY5dF/OETQwGko7y9vL4NrCbfZQtWvnUvuQjJv0i7nzg2wW4twAN7C9YdUXGq4v36l4=
X-Received: by 2002:a05:6e02:4711:b0:431:d63a:9203 with SMTP id
 e9e14a558f8ab-431d63a93fbmr101492025ab.19.1761321437606; Fri, 24 Oct 2025
 08:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy1fCCdciZLqmoeWDG_QoOHDi9j0_ZZKYkpGJmWrf14Q-g@mail.gmail.com>
 <20251024133116.73803-1-fangyu.yu@linux.alibaba.com> <CAAhSdy3E7-uC=pwU3c93bj3_xykPnLUcDXgKJtJ0KYeL91tijw@mail.gmail.com>
In-Reply-To: <CAAhSdy3E7-uC=pwU3c93bj3_xykPnLUcDXgKJtJ0KYeL91tijw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Oct 2025 21:27:06 +0530
X-Gm-Features: AWmQ_blSmL4OTf6qXTR2BfjEwNydZe5Z-dw51LCKSd1XhTinIaUMHniok6lfuns
Message-ID: <CAAhSdy1+TLUgi54uiHg7xomUo7tA_rs7Kt6b4OdUCvDQXjZYiQ@mail.gmail.com>
Subject: Re: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	guoren@kernel.org, jiangyifei@huawei.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pbonzini@redhat.com, 
	pjw@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_085718_855332_25696730 
X-CRM114-Status: GOOD (  18.64  )
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

T24gRnJpLCBPY3QgMjQsIDIwMjUgYXQgODo1NeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBPY3QgMjQsIDIwMjUgYXQgNzowMeKAr1BNIDxm
YW5neXUueXVAbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4KPiA+ID4+IEZyb206IEZhbmd5
dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPj4KPiA+ID4+IEFzIG9mIGNv
bW1pdCBhYWM2ZGI3NWE5ZmMgKCJ2ZmlvL3BjaTogVXNlIHVubWFwX21hcHBpbmdfcmFuZ2UoKSIp
LAo+ID4gPj4gdm1fcGdvZmYgbWF5IG5vIGxvbmdlciBndWFyYW50ZWVkIHRvIGhvbGQgdGhlIFBG
TiBmb3IgVk1fUEZOTUFQCj4gPiA+PiByZWdpb25zLiBVc2luZyB2bWEtPnZtX3Bnb2ZmIHRvIGRl
cml2ZSB0aGUgSFBBIGhlcmUgbWF5IHRoZXJlZm9yZQo+ID4gPj4gcHJvZHVjZSBpbmNvcnJlY3Qg
bWFwcGluZ3MuCj4gPiA+Pgo+ID4gPj4gSW5zdGVhZCwgSS9PIG1hcHBpbmdzIGZvciBzdWNoIHJl
Z2lvbnMgY2FuIGJlIGVzdGFibGlzaGVkIG9uLWRlbWFuZAo+ID4gPj4gZHVyaW5nIGctc3RhZ2Ug
cGFnZSBmYXVsdHMsIG1ha2luZyB0aGUgdXBmcm9udCBpb3JlbWFwIGluIHRoaXMgcGF0aAo+ID4g
Pj4gaXMgdW5uZWNlc3NhcnkuCj4gPiA+Pgo+ID4gPj4gRml4ZXM6IDlkMDVjMWZlZTgzNyAoIlJJ
U0MtVjogS1ZNOiBJbXBsZW1lbnQgc3RhZ2UyIHBhZ2UgdGFibGUgcHJvZ3JhbW1pbmciKQo+ID4g
Pj4gU2lnbmVkLW9mZi1ieTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+
Cj4gPiA+Cj4gPiA+TEdUTS4KPiA+ID4KPiA+ID5RdWV1ZWQgaXQgYXMgZml4IGZvciBMaW51eC02
LjE4Cj4gPiA+Cj4gPiA+UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+Cj4gPiA+Cj4gPiA+VGhhbmtzLAo+ID4gPkFudXAKPiA+ID4KPiA+Cj4gPiBIaSBBbnVwOgo+
ID4KPiA+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4KPiA+Cj4gPiBQbGVhc2Ugbm90ZSB0aGF0IHRo
aXMgcGF0Y2ggaGFzIHR3byBidWlsZCB3YXJuaW5ncywgYW5kIEkgaGF2ZSBmaXhlZAo+ID4gb24g
cGF0Y2ggVjI6Cj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MTAy
MTE0MjEzMS43ODc5Ni0xLWZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbS8KPiA+Cj4KPiBDYW4g
eW91IHNlbmQgYSBzZXBhcmF0ZSBwYXRjaCB3aXRoIEZpeGVzIHRhZyB0byB0aGlzIHBhdGNoPwo+
Cj4gWW91IGNhbiBiYXNlIHRoZSBwYXRjaCBvbiByaXNjdl9rdm1fbmV4dCBicmFuY2ggYXQ6Cj4g
aHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQKPgoKRm9yIHNvbWUgcmVhc29u
LCB5b3VyIHYyIHBhdGNoIG5ldmVyIHNob3dlZCB1cCBpbiBteSBpbmJveCA6KAoKTm8gbmVlZCBm
b3IgYSBzZXBhcmF0ZSBwYXRjaC4gSSBoYXZlIHBpY2tlZCB5b3VyIHYyLgoKUmVnYXJkcywKQW51
cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
