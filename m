Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDC8107761C
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 21:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2AwA0GGSqzUZTgeWWNRt/QkRNvC7GJB1S4x0xOuQts=; b=nbdqwr6ARBRiMP
	w3JsqmkpAcuTbr9sAigVPoXZQ0dicUM23tkmDCeq2WOEZBx9S5bKYqFOGpz+vSMjQ9ZfAKAS6ZPmR
	zselWPFZOLJ6BGWlLkgWM/19+CtNyfqOkaSlqWQOWnPlqotk+n1cnm1NlIS2gIgEEUqiQhm6486cl
	YTUGvEysccrOJ3KO281QvbOQ2hhYEKoiGBFiYmHOM/A7MQq/XhpS63Q1tFRB95jO5IzXubpJLOiGL
	sWjluLIkSAT7VV+ANZkOy8xgdq5rXUMtUzSEo2Q2QQC+EO1YTnUwk6CQrcjVHPsf4ThXQPgg9ypXD
	oOzkEBz4aFY6ep4nhIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yIa-00000009NDX-0yyo;
	Wed, 18 Mar 2026 21:19:28 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yIY-00000009NCu-0HI5
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 21:19:27 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-79a46260385so3861667b3.3
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Mar 2026 14:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773868764; x=1774473564; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1Qp9lS9mJbsbw6BdqhHIoqJG66lBxCc3NYAKkS9f8Q=;
        b=DubDZY/87GoCPOJi0ahxlHKpbCVOFfdW5jWWi1itdhhC+tg2v/hfi+pbis7+07JcA+
         SqjqjGsLxuCWeFhAY7PLyvB58F0Onz0cYaaAmzJFjQhWaXVK5y91HjLLV2Xf73aHuiX2
         i7j6x0xlVZv/QdF0WrS8HIzfe+2GegWvSPeUsqDpEIK/vD3mwfdEWecXtHBylTt7HCy8
         gs0xSUuiEi6KQXTnyL/vOoSHx2U1pQHazewRI7ijIZbu9dItNfCcWBO4qrrN1lDXJxnm
         peeULC+uNdLS+bUE9dfH84PRJwTff50auSfdP67zyI/b4eNO5ej1z8RKmNSD0/m1wfjv
         wOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773868764; x=1774473564;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1Qp9lS9mJbsbw6BdqhHIoqJG66lBxCc3NYAKkS9f8Q=;
        b=oaGhr5ewk4xPWtOvZ4/rKniOnjgcKX6/n+pCfIM5XJj8bSpjhVcuHuzXXRYgD7hqWG
         fZIMkhOUbktG097DIEUKabCXWaKxiEDzLMFS2n7zXsP2KRxon7XCVjXPCNXl7ydIxzdb
         7dAgx6RN9ysMuZpt/cGMJ0u9P1vqw6pfn0PfvqeKLHtNi6peutGPUd2qOaIxw/UkZDt7
         umhfbPmASRZIY+QghzoKli6kXrNRGLSiwWKPDaDbNNZVY3eOsXLOQX2aOu6v4Xtxqj4W
         tLVrdYFYTOj6a7bT63tiR8IUaFtak0fZyJFlLviqajF429vIRrsnmVvI1Qab7dpbO0jc
         5q/g==
X-Forwarded-Encrypted: i=1; AJvYcCXyqjpwul8h9OoHe6MrSd91h8tMGhAHsuIk0QkwXamv9cFz2Vp4MCLxeSzarDBIAuCDCBtUAbHFji0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPQZzK/JfzMI6Ra0mEV+qSnFdToXmJ8R41dnD4Ve3gI5mFkdD6
	mWkxqYMwDqIsb15qrxFvNhXSoCHfap1qXIL1vT0qkUziJHluHEldYhAy
X-Gm-Gg: ATEYQzzshsvWBP0sX2CZhNSJyTfRRdwnribqWDSGwfZQ2bAxb0w7W7lsO1bNIe+R2V+
	KJ9toKLDG6+mhtsLYYqNpcVPfaoiGz1NNqc6YA+w4HePa4JTR3LG+BMFV4pA5n7Sqo6X+SAx/1D
	aQqnuD1emIdHZLJccbpgHUcf5E2ds97/5awMSqhLd0yV5LbJAuZNjiiRiB0GvRdPk/VsOzL5KL2
	kqWUypDZ1O0c1vE5PUAfOCkfldkHlMImJeCQnWS0rYbYandaGZB9KtzfayGkMAicIiKX0U5/xIh
	Z2OpRwZOaDH1pOXv9DohWUwVRAjCkuszmDIPtYHjWqH1PpAxXZWDGxRsmmi2RRqFC3noYEJFAFm
	VDoqAqVNIjSkGjKv/atnjX8o0ibJp/CicjbZhMXovPMgWBh1X6SkNim8rdGiVYAtgWVAOePLMQs
	7uSXgTdiZOHKM26nbato9P351NiXvxObr8lbt5IgNm6RlEKotPEW5gwR3pxYi/s1t/jMu+cF+L8
	SuzLzUEvDMr235EGPDJNLBlQixGipCZ
X-Received: by 2002:a05:690c:dc4:b0:79a:2ef2:82a with SMTP id 00721157ae682-79a718c82b6mr50873677b3.20.1773868764218;
        Wed, 18 Mar 2026 14:19:24 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a7136de7bsm24223777b3.2.2026.03.18.14.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 14:19:23 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 18 Mar 2026 16:19:22 -0500
Message-Id: <DH67ZVO5UL9G.3SP1BFT4TQOI5@gmail.com>
Cc: <atish.patra@linux.dev>, <pjw@kernel.org>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <ajones@ventanamicro.com>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] RISC-V: KVM: Fix out-of-bounds by 1
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, <anup@brainfault.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260228152226.2116895-1-ethantidmore06@gmail.com>
In-Reply-To: <20260228152226.2116895-1-ethantidmore06@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_141926_108785_61ABB2B6 
X-CRM114-Status: UNSURE (   8.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Sat Feb 28, 2026 at 9:22 AM CST, Ethan Tidmore wrote:
> The array kvpmu->pmc is defined as:
>
> struct kvm_pmc pmc[RISCV_KVM_MAX_COUNTERS];
>
> So, accessing it with index RISCV_KVM_MAX_COUNTERS would be
> out-of-bounds by 1.
>
> Change index check from > to >=.
>
> Detected by Smatch:
> arch/riscv/kvm/vcpu_pmu.c:528 kvm_riscv_vcpu_pmu_ctr_info() error:
> buffer overflow 'kvpmu->pmc' 64 <= 64
>
> Fixes: 8f0153ecd3bf1 ("RISC-V: KVM: Add skeleton support for perf")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---

Friendly ping.

Thanks,

ET

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
