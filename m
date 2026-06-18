Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16AACD98F6
	for <kvm-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+gglIITyh336eTjCUEaOQK3YF5lQWd2gH8G4IIja00=; b=Y1w/QeBHzzhY1E
	Cc9eSAAnZyxQfJGa9J4Q1uP6NWIpC0xnFYcb3byfm/SfJRYULoUKDjkio+0xNDiBiJUUXaLSFSXZb
	+NN7ZqmlxqxBye9Hnat52TfUfntF3r0vkC8ftHNf3XY7/wDBMx03Pi5BBCEGxIgRDfpPS7avElAq5
	9MvI7CZC3CohBmQ7FO+T7U4RhDxnWPD1Lc+tzlo8cdKK10PWS6T9AQdhIGxKSKKJRtXWe/xHkLTt6
	kqimrK6iOQAMHZd9HRh5auzSG+xjJ/F9LW63vvwdAOnUQCnTk0GBLm0j+gPqvdH27FlcuE64uV8NZ
	DJMWg0DuWBo5oy8KYJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEiR-00000001UUQ-009T;
	Thu, 18 Jun 2026 15:31:39 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waEiM-00000001UTt-2PFW;
	Thu, 18 Jun 2026 15:31:38 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781796692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RAAaHoeh/MJumT7Jl018zpIQtLKmhwOXGGNn3ZLlRog=;
	b=f4b+IXkQhTwpjwvjeIS1sST2BLVtsjL1UEdnmxNOL3lPDXGXN8p4pBZTulWxnvylYeKVFG
	uGbMKdwi+CpjyDB9PBq7i6vVXxyG8S7BCgaClErdpvv1yr9NTz2M+bFLuy8zG75x1SYbaS
	I5Y9y3yuOPT48X3zoEALahwLSuvgH0Q8Z9+txzIcZmx49i0Hh3TBkpmj6sAJTM29MEshDP
	D2zBkkEYZ1hnAs7p/LoLBujaAGEGCdM4L0Z33LPyovOnyyDwz00riz8cpvuLnW8BW887CI
	zRIBZp7UkIF0mKRU2sNooS78DgPMPr5zjfTxECII4a6DfL3Lt7WcjsCvWBnliQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781796692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RAAaHoeh/MJumT7Jl018zpIQtLKmhwOXGGNn3ZLlRog=;
	b=t2jc4irZweu5KNBW2cs9NoLMghLuOSyOya4gG6B0vbJPWT7FpL5OwzHy+GB23sGgly2aig
	sV+QDO9IaCT6MHAA==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Charlie Jenkins via B4 Relay
 <devnull+thecharlesjenkins.gmail.com@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 04/16] riscv: kprobes: Use generated instruction headers
In-Reply-To: <ajOezhejx7PcOw_x@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-4-54b4736a1e77@gmail.com>
 <87jys5egum.fsf@yellow.woof> <ajOezhejx7PcOw_x@blinky>
Date: Thu, 18 Jun 2026 17:31:31 +0200
Message-ID: <87fr2jq2zw.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_083134_779881_8BDCB804 
X-CRM114-Status: UNSURE (   6.37  )
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

Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> Since I was checking against the previous version it's not possible to
> do a straight one-to-one conversion to the kunit. I think it might be
> possible to do something similar but I will need to mess with that to
> determine a good way of doing it.

Perhaps not to the existing kunit, but a new kunit which calls the
simulate_*() functions directly. Just an idea.

Nam

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
