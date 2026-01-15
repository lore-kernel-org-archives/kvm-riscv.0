Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7B4D3CC92
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 00:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARVMQ7vU+5TgOXyD7dzco4Vyguv08JByl83lySU9v2Y=; b=zCtnU6WI9ibwXo
	1l02BetoFcYJkfnND2LR+1PERYKaGK2Q9UnnKQKKK+qb5sfqZLbVR3ilW+IWqnA5KHqx5N1oQh+O9
	HoMdcZvYTWA7uq4ZL5oLNRwE8t05vXq/4KWdKhmlL3HNffkQGy/ZlQMlUlbY9smowen3WlN6gmGm/
	U9oC8WW//pkkTdxSMzVfvuA4YGZDdt+SoRdfxstZrl9yFaWIXfmgHG1okdRuFVzsgWYVY06Qve7cY
	56IgSdmfXnv4wv6rAgBnKvi+NaITPjRN6+pRFYz0nLr6FWFxvFUz9KaN3ZIigghstNeAdPAlMXAmV
	b7TxGKjGJG4zKju2sJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBOE-0000000BFsQ-3vjr;
	Thu, 15 Jan 2026 00:39:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBOD-0000000BFs3-28Kj;
	Thu, 15 Jan 2026 00:39:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 754836000A;
	Thu, 15 Jan 2026 00:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E154C4CEF7;
	Thu, 15 Jan 2026 00:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768437544;
	bh=WS7t3IYx3J3S2sfRX9DCoDfu6yOLG0lLMoSGMRG7+X4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ltACZlYZs2UDJYv8s8k9TlXywIYpZWNHCwvgHAMfYZqY/R8Zaf7wpMh88m1HkBydD
	 Gc7hETrNO7iT1cYc7OagiSyMjsRJ77uUw9qPO6HpoXRCowImjF6KhRZ3C7F0bYHxqK
	 mot6FcZOOI4FzhB+kqOiO11LiDVSQaIHv8G97KZM04TNUIHW9Wsh97cAYTQkE3ledh
	 NRjJlxqbRl3w6y25gsMgqfFQU+1AMjovYcvcVNBPGIyGQk065QELZC3CWTDnmMIgOY
	 9yRMzcoikBMnjMZWmV6weqdItRB/uxRlL5Mr37OUto7XLBbzVacovEdjMlMxudkSkp
	 SWxD4U47bZi4w==
Date: Wed, 14 Jan 2026 17:39:02 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Naohiko Shimizu <naohiko.shimizu@gmail.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    anup@brainfault.org, atish.patra@linux.dev, daniel.lezcano@linaro.org, 
    tglx@linutronix.de, nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
    kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/3] riscv: fix timer update hazards on RV32
In-Reply-To: <20260104135938.524-1-naohiko.shimizu@gmail.com>
Message-ID: <10a102b9-1dd1-c5ca-66e4-f02794a84a93@kernel.org>
References: <20260104135938.524-1-naohiko.shimizu@gmail.com>
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

On Sun, 4 Jan 2026, Naohiko Shimizu wrote:

> This patch series fixes timer register update hazards on RV32 for
> clocksource, KVM, and suspend/resume paths by adopting the 3-step
> update sequence recommended by the RISC-V Privileged Specification.
> 
> Changes in v3:
> - Dropped redundant subject line from commit descriptions.
> - Added Fixes tags for all patches.
> - Moved Signed-off-by tags to the end of commit messages.
> 
> Changes in v2:
> - Added detailed architectural background to commit messages.
> - Added KVM and suspend/resume cases.
> 
> Naohiko Shimizu (3):
>   riscv: clocksource: Fix stimecmp update hazard on RV32
>   riscv: kvm: Fix vstimecmp update hazard on RV32
>   riscv: suspend: Fix stimecmp update hazard on RV32
> 
>  arch/riscv/kernel/suspend.c       | 3 ++-
>  arch/riscv/kvm/vcpu_timer.c       | 6 ++++--
>  drivers/clocksource/timer-riscv.c | 3 ++-
>  3 files changed, 8 insertions(+), 4 deletions(-)

Thanks, queued for v6.19-rc. 


- Paul

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
