Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61235CA101F
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 06:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xpebf+6M7hc0h6R/ivvCs0Ep0N3YtMIQzyXehwO5tLg=; b=sZ7ph3yjZFSb9T
	1+Iop0gL4LEZj/prVQRIWCvhX812Vukm+5kT2aJd8w4kyD4wDlm0qFRMysLt1LsPI/tOYnrawEfsv
	/zgEiZbHZtbaOflfx52LZNAK9EkkzBihPrjJibZl/B3SxGGhIlIfiBzUv/sPUOLFAzacs/9+aZRIA
	3tL5cpBmxDLmFg5iVwp0+79fxpQ0S0C0lWga+uTcnwxEA5d/HH+DmAN6JB+Kop0q7yd4/P8VTJU7e
	cApiHO3eeYvvccpeeFIUflYCj3d0qzHeZLZmwmDOonlEJ7tuNJoclysYOfJ0URAm8tctzlR6T1+Pk
	ksPRnhCSH6ZuHHgn7QGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy2ex-00000002up0-3ytd;
	Mon, 15 Sep 2025 06:25:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy2ew-00000002uoj-2uxi;
	Mon, 15 Sep 2025 06:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BCC96014D;
	Mon, 15 Sep 2025 06:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D65C4CEF1;
	Mon, 15 Sep 2025 06:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757917552;
	bh=YXcIhrbg/wc7/PC0yhFG/NxcxwFsfdkDJDbFz4bgiJo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NlJfJLF7m2EQcyHFVyI/13N9QUB8Cft+tGjjcwm2v4qFJzXXHZcfIRcaPOKWtEm3Q
	 53a67rBuOs6EzCf1tJOPVATA/lku9Lqm64q8eQm0oyU8otM22h1qtPmBlYUfgazuIX
	 s2vckc1AEmG1XLvcJp0hmMA/Z0NSoElXF3If2J5IitpCaJkxwRs7dmLWQiBYHlyyw0
	 l1jdYhYCsltrJlJrNKjcaicpNUdONiCcNwwR+XNFL0yckEvExlW1ZK730jSMdIqkDT
	 trxkfG+Vyyhz95CaL1S3lhlvuXn4oCm7QBaA2oPoNnjxHqU5OViT/BuZrjgR6hLbe7
	 9oy4QSJJvrFdw==
Date: Mon, 15 Sep 2025 00:25:52 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>
cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Mayuresh Chitale <mchitale@ventanamicro.com>, 
    linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
    kvm-riscv@lists.infradead.org, Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v6 0/8] Add SBI v3.0 PMU enhancements
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
Message-ID: <f740b716-6c8b-46a5-31ae-ecc37e766152@kernel.org>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
MIME-Version: 1.0
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

On Tue, 9 Sep 2025, Atish Patra wrote:

> SBI v3.0 specification[1] added two new improvements to the PMU chaper.
> The SBI v3.0 specification is frozen and under public review phase as
> per the RISC-V International guidelines. 
> 
> 1. Added an additional get_event_info function to query event availablity
> in bulk instead of individual SBI calls for each event. This helps in
> improving the boot time.
> 
> 2. Raw event width allowed by the platform is widened to have 56 bits
> with RAW event v2 as per new clarification in the priv ISA[2].
> 
> Apart from implementing these new features, this series improves the gpa
> range check in KVM and updates the kvm SBI implementation to SBI v3.0.
> 
> The opensbi patches have been merged. This series can be found at [3].
> 
> [1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf 
> [2] https://github.com/riscv/riscv-isa-manual/issues/1578
> [3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v6
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

For the series:

Acked-by: Paul Walmsley <pjw@kernel.org>


- Paul



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
