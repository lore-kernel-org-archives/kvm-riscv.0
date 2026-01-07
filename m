Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B4DCD5828
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 10:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NiLziAIErq+11YtfhBTSEOKPwQmkb3liMj/H9LHQ3/8=; b=MW4oM1c4Cnyphj
	7a8y6cjpnmynZet4F8NbZ69ptYfM9fyWN8f71N1bkCuKK1Od0ZNC694zmiX4b0NZfSErAuOccwQgS
	JX9aYCc8fIvBL4TNU6qYVgH/MEz0bwytAyupSu4/oaEs9Vw8YyQAHaUrQcUHlnimqK0Hk12XsF2lX
	K/jm2XAeDWxM+OvPO6vCR/9KXzg63qRP36m4prOx32qX8gvV+tOqK+pBZSr+rK282XsXMt3rcXf67
	tqAqcSnavLGzJWYHq6ZfNNznmPj2FZ6XTyMTgEwA29QL/eS/zOl0wIGaE+WKahKogrjGKEZjt5GkO
	CudpYSF4CnsIxJReZDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQMJ-0000000EdPP-2TGh;
	Wed, 07 Jan 2026 10:01:43 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQMG-0000000EdOM-48X2
	for kvm-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 10:01:42 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-55b6a66f155so756586e0c.3
        for <kvm-riscv@lists.infradead.org>; Wed, 07 Jan 2026 02:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1767780097; x=1768384897; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1e7HzwoffI5S/6V5SheLWTLvf9f05N/KDUwstam8N0k=;
        b=G1276w88YA/COqFxr7IqGhLGN9sYoogjH9+0xFLdE7cq0kYLSFkH7zWuQZ9sZkxVBA
         3UWcvHRTYEvFms3fztE1+23s6h3dPU6yFZC4uryXj701BW7tb7Bz0QhtDuYr8pgOaWNE
         uvJEOE5ZIrkpdZ75gEz8YRXp4iMgJ+E5d7jkhwWJHgLwMd/rYvQqmEX/ukMK+BJOMzsG
         10bu2ytCXg92os8z69c5Ncws8RUMzvJS8grqwEwLoStSaASEOmp2CZ5+ZCI0+li63gn9
         ml5kdZwIY2sRqtewukj/fz5oYNU5gAxHWhAcGtEcSHtMU8L71c2IRCfWBnDNw6TscqYg
         MW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767780097; x=1768384897;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1e7HzwoffI5S/6V5SheLWTLvf9f05N/KDUwstam8N0k=;
        b=nq0TgMQZ4A48qiUuUKkUuY0pjx/vbk9lxsVhIRNP8D532QyxDm9mNugTmHJWGvmpiu
         rj8XulYumqm8DKxcOWxpGJjrNtaXXtqEzrIlZGVzEn8Be5EHN633Dqrdr+DZeqZnjnFR
         am2uqMwSXmyul8iXLKkLgXAu0X2npLjVcy3gvuPQtVNhMGYMu16y+/P6LCdvhmSR+2CY
         pigElv52C+UCzNov3XFndCv1bAosVHG6EJXmNyPklyADpbnRTDrRYYGFAH5cgS++UXZS
         Xm0clltTWIkgj5yG9NQcgDOttonKDsJellg9CyLpN74iexVu6Yff/H7imQkwpdkEW9iL
         XD/A==
X-Forwarded-Encrypted: i=1; AJvYcCWZkRbtiTlcYQppbhfgFmjQdWSnpiZpWLvjxS6Fq9dfESxsSbc+o79PQfCCcTEOS/DiYcksfm/6B0o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEkXfI9Q7fUIuVbUlWR1PBU8AKzOl8KHmsp+neN8xnQmXYvP8D
	I3rN1J0qahAzIqgPB1omkQgQ/FymssOERXrpvp0khslVfurNQ0ygpCzxqEFzp4PFht2vTSTILQh
	W2+DKpHuviJO7z16tJEtNgHTNt1zuCHxzHVgKTUm65Q==
X-Gm-Gg: AY/fxX53qbBtkfxA6JIZZa493clCyN7RybxyfF+7qCWEh5O5DdhkeTllf6sHroPq65r
	swGOUO6GgX87FrAjcKDruVlPjwqTe7NnPwsIlz9Xlg6NrYJv7XkRKLTT22qYAxqdmS/XiE0bZ9o
	BCxmupOO5xtOi3zc1taUnFoPUf5CN1x4BIEGSLoBhDq3TICAC98ABCQ0mB4y6kbS+RXyDc66uxU
	Rkmi7wSIIsA7KyhGx9F7uQMXye+UwUumo2f3i1jvfQliDg5Ks6P4mOtsUjMJdF7j+givbP0QHsU
	bUylzclb
X-Google-Smtp-Source: AGHT+IFY9o6LoBGhJfHFhrwQmRjYbAjez+97Fc8MV2H/JqEGQGgiF+2CT3xNTtCeZryZYDcntgXs7hAyuiU8xea9t8Y=
X-Received: by 2002:a05:6102:534f:b0:5db:34b5:318c with SMTP id
 ada2fe7eead31-5ecb6955532mr709984137.45.1767780096723; Wed, 07 Jan 2026
 02:01:36 -0800 (PST)
MIME-Version: 1.0
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Wed, 7 Jan 2026 18:01:26 +0800
X-Gm-Features: AQt7F2okIYDpNGyBgdlwrVkXSKzrOvkkA7_TMkO--kZnCCpAAR9jkMnVcWZBt1o
Message-ID: <CAPYmKFscKJ1ff470d6YmuMxLdJPSZ-ZmuGMMAFO83TT-vvV2JQ@mail.gmail.com>
Subject: Question about RISCV IOMMU irqbypass patch series
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Zong Li <zong.li@sifive.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, joro@8bytes.org, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Anup Patel <anup@brainfault.org>, atish.patra@linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>, alex.williamson@redhat.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_020141_022210_F217C665 
X-CRM114-Status: UNSURE (   6.77  )
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

Hi Andrew,

Thanks for your brilliant job on the RISCV IOMMU irqbypass patch
series[1]. I have rebased it on v6.18 and successfully passed through
a nvme device to VM. But I still have some questions about it.

1. It seems "irqdomain->host_data->domain" can be NULL for blocking or
identity domain. So it's better to check whether it's NULL in
riscv_iommu_ir_irq_domain_alloc_irqs or
riscv_iommu_ir_irq_domain_free_irqs functions. Otherwise page fault
can happen.

2. It seems you are using the first stage iommu page table even for
gpa->spa, what if a VM needs an vIOMMU? Or did I miss something?

[1] https://lore.kernel.org/all/20250920203851.2205115-20-ajones@ventanamicro.com/

Best regards,
Xu Lu

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
