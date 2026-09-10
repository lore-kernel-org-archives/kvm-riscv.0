Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9722BC79FB9
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ci2I9HNvUaju3LIK9wN2fOjcmHuFzCaAoXGrwtDR/yo=; b=xUnyHO5WhzAvca
	dBmsNFb7a9R9p0tyY/hIs4T1QL4s9M1ZSSSYnBuHL/gFDFaNhlE0U7l2UwXcVTHm0i0IqfGyvWdBs
	Ijtud7LQIQi5drVe8Eyo0AhKI98sClFYRVjXxrVULMkCNR+5CXOOSzo+6o1i55uo8qzPTJENf+VxW
	tTa7XH8a/swuYHFCP2Grem+m31xNVwi1ifloGOnPiWVAbTH6oFkUylPeMpzhCu6m5n2fjGcMFmA6Z
	xa3JHpC05KBQMY+0z/H7CQ7vLW6UWHmAmjhfOSQFX4pxx3eNTwJdwicYq2BVjMBJp5uhDGPqWQYby
	Zvo7sPhrYHwayD/2Fdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cfD-0000000EAXJ-1JoK;
	Thu, 10 Sep 2026 11:09:55 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cfB-0000000EAWC-3SEg
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 11:09:54 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4bfb6so640509a12.3
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 04:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038593; x=1789643393; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8QbTTWk563brFKzUulM5hzJdIlUHhbe3RJ1vb+Th/iE=;
        b=bALyQVsBq5fFcFh98px3Szyliy0W9ZlTcLUdjuf0+paa/qObkTKJ38dvdupgtZR0L7
         srZxMiwlhvz3Qhth6pVQTDgYlqq1xww3lqFHjns+6zNxilWaFlPoxm8QepGhz76aitKF
         qQUb6Fi5twbsPhV23WiRCLgrx0W0NyHQ1tEs8SLIMEYYeSz1mgus2dDm3z26z3xpqsrj
         XqoGrrh4Dci0jSKOrRrt2K52MoS2bGoOETeRLKD9uCErWznvDZy4t3RSyqMjHavF3lz3
         621Oxvw11xm2N71hJZnEFuULNqJbavLlEuf6TBP9jx6HaEBps9nNw9hCaSxxPKkVICV1
         fmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038593; x=1789643393;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8QbTTWk563brFKzUulM5hzJdIlUHhbe3RJ1vb+Th/iE=;
        b=n9j5mZkIUffM/YV8c1KoAkcmpECDpSKohwUowZVaT7KO/V1WISeGp9bffJCGLbTMwU
         dOQJS6QdsYu9e9pYPgnVOxNLXNx+7Sx+5ZB9o+x1Zmg30GTpl84au0h5WJaxZKTTSbQ5
         m3IJxowEDwwhqU2ktVBotKdlMA8zpPWZVqLfPBl6HZhFzL6KT+4jSe05eWAA2gNZ3yty
         q+VnoI4t8bdjaPeQV3pk+ETIog/dMXp29yxXMEopUGRoDVNPVHdjZL5isudXV2wp6RCd
         Xb2vgTMHI667/ftWS0SeMWH/r1OR8KTWltjjxqJnsejnkVMC5v4wWQD8U4pPSG6qHJW3
         O/PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAmUBP7sCZMJVvfM3ISoRbIOiKujcfRcp/9cntVsw5UD+Aoohfuar+zxsrNtd//zD0BGv97BPOZqQ=@lists.infradead.org
X-Gm-Message-State: AFuF++mmpzAOJjsGt9q6Xnqi8/3b5OyQ99Vobb9sItIxkHfc91PlVMeU
	WCuuO9nw1VhFjgCt1cRA6ZmxSm6YUCwhDKwiTx9ciBgWvwNWA8opc/Ku
X-Gm-Gg: AYBFou0dO5xz4Vlgcw0l6ZodZfl+7jQN1/vjxCpaFvfl7LPvxL6s9kbh4PzbpneB+c/
	bTiSNI/RYYZD8WkJT/zzluf6AfT1OUHpBEDWSwnVbZmhhOvHogo9ybxJrFFcq6i3jGMcZyiVn2P
	/pKxYY2jwtcfkwMAYShVdLUYrkmqy4+syUhJ1liM4glH1jmY8IdrvcZ+BvcZhNweG0IUlrG+fXZ
	VQ4oDcj/Ekz/sZ1nAHqEMGK0SliNNppIACCP9HkgJHQj5s177csGVHDQb72axo7+usDdmH/lye5
	m0fFSVGsRcxZw4OPcq1ar9QXZcwQnYDdZSZXB08IzkGJSnEGKtHqtDKjnXIdN99hZCkOAckxuQW
	U9iw05HH5wGc+gTe6v5MegVCOhtNkg2lQeTjWamhbTw73lgSIttVTHoTR/T+2NtfYBBKOYJiZa0
	71ox8fvExmUEpogTtUjPWdoCRaMFctrWJyRiZFO0SZolOxFBaOjxJTzlrRgWXME414RtTt2Qg64
	Pkvkl/2SzNqT6hHqyWH5p5irWVLUedxisyWfGIbfJXNQXnJVlaw1qY=
X-Received: by 2002:a17:90a:ec8b:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39d70bb1bd0mr11082578a91.19.1789038588475;
        Thu, 10 Sep 2026 04:09:48 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm68881202c88.2.2026.09.10.04.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:09:47 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 11/20] KVM: selftests: Initialize vm->memslots[] with invalid memslots during creation
In-Reply-To: <20260902164123.2546762-12-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:39:02 +0530
Message-ID: <7bkt1hyp.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-12-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_040953_854289_62E4DBB3 
X-CRM114-Status: UNSURE (   5.12  )
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

> Initialize vm->memslots[] with an invalid memslots value during very
> initial VM creation so that failure to configure the core memory regions
> generates an immediate assert instead of potential weirdness, e.g. if slot0
> is coincidentally valid.  This will also allow hardening the region APIs to
> guard overriding a region's memslot multiple times.
>

Sure. Looks good overall. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
