Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695B6C79FB9
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 06:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5uYHdyf4stu+b+x+QsaTBNkgNE955goeda87C/7qncQ=; b=WFaTZlhoXHG4TV
	anYBgdvI3Sh4QUBxzFNfePR4/Kue/CGbdyhPD7CSmqKmr0ySLTslTcvWrege+fWahonBjKUSpVgqE
	SImG/f6cHeMGVCGoQxbi8oTpWWDOrUc070ZDufca2QtwxMHCxt3ED4/LQu6LvaPfymLHHoIDufNy3
	pUGRkkEYdPilyFdQeGvwv6i0uRTSIf5nykbT4cVHOhhYT/ySrwkaix+t20CBvepMHYBvsYgyaUx1b
	t+qP/MhWSuXIarcRcJdEn6r20Z1lJ24fv3FEh4wkmLQl+kYAJIhLIjZHvCQnjwgSihESgdoxDeukG
	eH7B2XogAdY57OAZ+CUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YMx-0000000DWfE-3cPv;
	Thu, 10 Sep 2026 06:34:49 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YMu-0000000DWe5-3o8H
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 06:34:46 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso7079944a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Sep 2026 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022084; x=1789626884; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/uaCqa1UBzrB4l/x0ktWW2Ji3uA4tmOrYEYh+8w3GLM=;
        b=jcHLg3DLryz/LmqgqW6DgVA9xbuIk/1iNGYkocVjPj+3mFYXrtbAAHvFE0t37u0+az
         3soVBwmYt4/qTfQtdeJVDCOpblbg5G6Gs2V9jhtWlM+ZyzVPbad4NhotF4bKwTcUkpV5
         EMwJ9uAWGy7VjUrE82Y6IhuDUtJLbY+Qv+epkov9euJCTwJ2gRl4Hu4oBj0w6y/b4/kQ
         Uy2pk7zg/RUHHLv2v1VrujmFNG1u9yz+cnrYEwaajit71h/cCb8aB+ANZISWJpYHfedI
         XrE6F0gXy15T05tGrau4PwDAzEDOld3wnzAe61hy9Ed9PE5obt2mRV8PysT5jTxCfu4i
         /cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022084; x=1789626884;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uaCqa1UBzrB4l/x0ktWW2Ji3uA4tmOrYEYh+8w3GLM=;
        b=QkJVp9Lt/asodJeMqqdEAGrGQWPP5DjpCvQS10Sz7gIsbEULxM0pWgNd82weydUxJR
         cq/XIWzFHbxd9kghGT//ExZIYy3swtxd0aPAkBqS4X1B0LsWW/BKzWgYsYUVnHBjaCDn
         xWjlpYKN0+ZGmXSlkeEUL4Rom1Qa7ekCVCPq70VIaJSutm6SX3tRuVOEd9uf7O7iqnuu
         8f30rZEnjEAQGIArqi5HvXyvVMtJjAQ1oDdfhmfV6Fg6tftG8TwJHGyhHT5DU8lKPEZk
         /vfklJzc3RFS32LOK4bu4BztKa7+pe5PuNxMp6Wu9CqblV2qiGcjGrwEKmSpGTT6DB6N
         sZMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5Fj8B7+OdCmeM1UhA/AGq9bpi/OPmWcfAkF4KrQSws3mjSJZm4xNnW8BO1U7c7pLb8a5hhgQaQE4=@lists.infradead.org
X-Gm-Message-State: AFuF++mdMkjr6w7R0yHoqMNADlXDMrBSiFb4XQF3GByBQCjj6RUZtNHx
	6FHKXiYcc+0cufHfis5tpRwgwS2h/yei7oh4ZEj03cwSTXL0Kk9TePRFAQ4w3g==
X-Gm-Gg: AYBFou39siCHwFkoAsAIVyrM+GlfYp/yWPlTHGRDnk3ugx0SyTNP35449+g6jYL/I7I
	myiO681i3YWl6nhD1dhvOSA1HyDkLBe6nQBn7LDpE9OOymLYfl0vpVi8ddICYpIOfeCi4gEbypm
	38YfSCKCsp6PR5Q2yieVtCAyzgkdtwiceOkf/AJpjk1yMko2OF1wM0pjdMxFfB8lXFJsHMrdq9r
	vMjFpoR6daVjZUdnJyHHuaxbGWSijUcHvJCL25c2rTp9itAaZzQipQniLlubJZgQLANJtPaIKps
	KT4UpSpwYc+1AP2hWS+LzqsaBQFRRSCGz/qN+oUBqJhUcxLGdI4hXv20Hw6f3hp4LQ4P5Ymhwr0
	N68f8A1HD6QgywNOQHmg8IlRu/msoHBn6FtFa1mOLpVQrTFrenAEcDSY+huHZwht9XPkjdO2Rs8
	RH37kNZQED/Cko8+aNDif1QAugGmNKMzoKh7XEMT0OP1N8XN0rCZv3B1TgIlG5/cNLWizDySuQP
	Dle3uKRFx3geHLHPK+mCfuT3wu05oAXZIWZFqq4/hDviwNj2U56AQM=
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr57429977a91.1.1789022083690;
        Wed, 09 Sep 2026 23:34:43 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm10434389eec.20.2026.09.09.23.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:42 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 06/20] KVM: selftests: Extend page allocator to support naturally aligned allocations
In-Reply-To: <20260902164123.2546762-7-seanjc@google.com>
Date: Thu, 10 Sep 2026 10:57:06 +0530
Message-ID: <fqzh1xsl.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-7-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_233444_971982_201A69B5 
X-CRM114-Status: UNSURE (   6.61  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Extend the page allocator to support naturally aligned allocations, as some
> flavors of PowerPC page tables require multiple guest pages per table, and
> those tables need to be naturally aligned.
>

That's true.

> Take care to align the potential base address *inside* the retry loop, i.e.
> the base needs to be (re)aligned on every attempt.
>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Thanks for sharing the changes. Looks good to me.

Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
