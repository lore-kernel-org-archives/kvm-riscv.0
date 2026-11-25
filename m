Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D699F606A31E
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 05:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nLLOcS9n;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=oizITENK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hAzdjtOsyjEvE+j407Zta1VFZbbF7n7HSbn8Jz+odjg=; b=nLLOcS9nCCoz1jxQFPeeGJgac1
	Q+7Obe3hDnJregdXAedUv0PQ/fvehyKpketksKfxwehegRlDlJL7fj8/unpyjqecOLOQzr1120jrr
	jJgJfYFQjlMM7MPkDUOl+bMHaoGIX3b1FTvAUTcZUqJ5Q+0cU8H3BjToPX05wc1hi4fkpAI2+kQXw
	oP+4oJRlRPjeb3p3BPGGgSBCjUHG1uuVZUJNVBZQfwFV51u4w0fur+tBTHVkfxba9Poywqj8CykzA
	7TvT4kFyHcAd5IwQSD4w/ssXYvWh1J4Y85fOSc/BRGIt6LjEh97QnA3880jvH5G0IiMA67TvPCTRh
	15xSxlXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tP-00000008UH7-2PgD;
	Wed, 25 Nov 2026 05:50:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tL-00000008UFf-3rLn
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 05:50:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4b467581b98so51352465e9.0
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Nov 2026 21:50:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585802; cv=none;
        d=google.com; s=arc-20260327;
        b=QuLsyOCx9u0I4pfMiJfj0+KaEDG4uk5JlTpxQUlwG4XmsNpALsetHsbFyYrfpAq68M
         FB79Lrvqkw4PKrpoeIGqhwe3CH8iQx0gfZDDSoClYbeFR6JZfgEyVxCXydxup95eia1l
         raxCqat82mZB3AoebEkwoQQ24ArKegEM9iSpImDv53n8uVlOCBKjqd/KyeJZV7iWEIqd
         pCa82zpZejBhDVv4fgqp1nsH96Tah0xQX/71WohAqfmzX8+2LRkzDlQAsEwoBX43eaW7
         5FeijceZAoLRKKQi1c+HUkB3jfOUgJ6a/dDEz265bM42UDm9il8jBjXMh8Pc88eZ8X/o
         NfPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AJcWadRJU+vTeGGYfzg2TttCaXCo1woljVumAlihtvo=;
        fh=Wx4MgQuGvnzX85/NH4MQCR2MXitICZNNEdb0nIFnpSY=;
        b=s3GpBLcxFyKz7pMCtKwdGLb7tOPbaVOzohbnbD++HAYlbKyDWDmAWR0WiU8CRC/SDT
         Z65/TmZiJaiDpPTI3Rl5ZldMgkjDXlQ7gST/023MLtI85XPWhAIbe9RpB0yz4FNDoeiX
         +C5CU6YkHXv2uR8QgUnn7T8LYYxrIxgP85Nr4i65fk603rBO0qzye6KtPYEukxbDRWO4
         Eqgv30twPloVNQ+ZMLnt00Rqp/tfzu5gZVQKRWaKQgJLBb91bBSfPpHLUaWCNvYYEIU9
         yzwWBgtZsuCSstHPr7bqhq9LLmdOlHvSpsa8K0wL5hL3ekLq4prYa60cHY7pZUDfVhc4
         i6IQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585802; x=1796190602; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJcWadRJU+vTeGGYfzg2TttCaXCo1woljVumAlihtvo=;
        b=oizITENK0+aTrj5BI24mX4aWndB8mD+xM9xE9iYWVOwLl8XJRLRvoF4C5Anz9dtYh0
         88NiDO8ieVxoTB7UfkvpmjO7cZj53VKpQc9B+HBEd52rqO1yqr9p+6AbsNgyA0RQXruP
         QXXkUKFgQZ2KkTp+U4rwzVFalODMVk0cvIE4w3+WSKEyuTeCA4intuKCxKUEicYa/3o5
         Fp+2LHOTaRFmrkrCZR506WohpZPFTGzCmm7KYWQOoXIeHUheE6jK/vKGx4iUjTsnLTSU
         UJo8MNRnvL/Uu6gra4b18vMu4i0BejuJ5RyZaq4XwIoxvE7TrNSjFb8+lybmuTG8FRNN
         bA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585802; x=1796190602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJcWadRJU+vTeGGYfzg2TttCaXCo1woljVumAlihtvo=;
        b=qkZIKISrOqMIoS2oqnuSKSSDNvtz6cjJbrrxTq5ywqGMQkg/ZYOB6kLafeWJaUoHHV
         uTTAQDxTr7/FASow0zRV+mFuuwH41YuMhdTy5QoIcE4eF2kjsxqZBe18Pla5NvUXDBl2
         U+hbP5YLfgwyQJK/zNEboIAxfVnyUCN/TT4a/o1BbCy9awhFMX0jAmcCMtTJaZVsfpgV
         v+Ypu3CKpwM0LNn0e9GLrkzJA4sbc92L2mnJmMJPTRTN9guJ/pz2b9G7nMH+hDDLJzZu
         anTqICM6jHUC3hccuE04MSmwdA4FUE1wS3rH1lmQWxSsjF14RYKS0cpeeTPLfAhfyBTE
         wZ4Q==
X-Forwarded-Encrypted: i=1; AL+hErG0MrnMn8TjNAWOXpAIM4ti7un1pb4+jFSs1uaM/8DCy8Mp/LGWOyHi4VbSbNtWx4pjVuGv/8fQ6WE=@lists.infradead.org
X-Gm-Message-State: APuU4Z8WQyV5JjegGvC0LOR8iVGmoEIbgb4hEGe5hviD0C4dv+SqVG1S
	tjJbV3A94R9uWDH9ps0Yy6XmXFB8FgS6iKT3WSqhtK1vN8zGa/6IRLxWyLLgJHMDLPn1/bDwDVt
	kEPiAsoFaVK5XGU+5n8arogHQ4EzA4f/J3Sgk+Xo6dg==
X-Gm-Gg: AZFdTZe+Xx2jn1dMeILPQ/BAz+/QAFslsUpbCnxSviwEMjg9J+34AAVGNmcY5dFHEsX
	pmX0uiFlfw1Q0qVUaWckBUGRJPi/njiaRcvcdBTy0xiwnr4+cliFp6yUDz3Y54kjtChduw5B31E
	colyx1WQ6ZgDhcHlw+jZkPebJEz4gLylkNOx+45Y4whODlio8HBncp6lVJxoCBqK/e/4mo9DeS2
	Pf8p8L0u69ZTDb/9k12bMgkPtAXj7X/pBCyzfWcS0XuldUuFdSbBlgbmA7RoKGo6tXU6NONQrch
	6E0iN4mgVD0jA7cL+gADv1ZMI6oG71qI0RJ9UUIBjPAytxG9lBzr3uIvxHtTo0jPSg1VwZDsKkj
	FQTJsE90zoa+z841rcXq/dt5HDfkfpEz0l2YMF1fb6UkVMr4WhAmwQi7hYCd5aPvlCfNd5Zwrxm
	OxCDqICvz17+ZBZC93ZeDIsOnP/AZYEjFuRHxD+CdDna038lfuEeCd+rQ=
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id
 5b1f17b1804b1-4bb88922df3mr317698415e9.12.1795585802059; Tue, 24 Nov 2026
 21:50:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-3-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-3-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:19:50 +0530
X-Gm-Features: Aa3M54qit6VRNciPHtVoHbdaqRLIxhuX2UY4YW1iBU3P015oUnZkIIeZ7ncDCSc
Message-ID: <CAAhSdy3aJo_S=miuWjFRwaMyd9XwDOWT94OLRysgZ3+r6-cvYQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] KVM: riscv: Read G-stage PTEs once when walking
 page tables
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_215003_979486_B76C1D94 
X-CRM114-Status: GOOD (  10.13  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgNDo0NOKAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gZ3N0YWdlX3B0ZV9sZWFmKCkgZGVyZWZlcmVuY2VzIHRo
ZSBQVEUgcG9pbnRlciwgY2F1c2luZyB3YWxrZXJzIHRvIHJlYWQKPiB0aGUgc2FtZSBlbnRyeSBt
dWx0aXBsZSB0aW1lcy4gVGhpcyBpcyBzYWZlIHVuZGVyIG1tdV9sb2NrLCBidXQgYQo+IGxvY2ts
ZXNzIHdhbGtlciBjb3VsZCBvYnNlcnZlIGRpZmZlcmVudCB2YWx1ZXMgd2hlbiBkZWNpZGluZyB3
aGV0aGVyIGFuCj4gZW50cnkgaXMgYSBsZWFmIGFuZCB3aGljaCBjaGlsZCB0YWJsZSB0byBmb2xs
b3cuCj4KPiBNYWtlIGdzdGFnZV9wdGVfbGVhZigpIHRha2UgYSBQVEUgdmFsdWUgYW5kIHVzZSBh
IHNpbmdsZSBzbmFwc2hvdCBmb3IKPiBwcmVzZW5jZSwgbGVhZiBhbmQgY2hpbGQtdGFibGUgY2hl
Y2tzLiBBbHNvIHJlbW92ZSBhIHJlZHVuZGFudCBsZWFmCj4gY2hlY2sgaW4ga3ZtX3Jpc2N2X2dz
dGFnZV9zZXRfcHRlKCksIHdoZXJlIG1tdV9sb2NrIHByZXZlbnRzIHRoZSBlbnRyeQo+IGZyb20g
Y2hhbmdpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTZXVuZ0p1IENoZW9uIDxzdXVuajEzMzFAZ21h
aWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9rdm0tcmlzY3YK
