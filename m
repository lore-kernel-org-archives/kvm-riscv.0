Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4975CE77197
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 17:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ng0EtyB29WWPAUyYVMkThmCExMOTMOVCvONiPMXeXgo=; b=icG9nFbBdf4uX6
	gLnw9byH+eXMu82zwWibeaijp2B/nPT9lT8ZVxgCbobx3YRYZ+khnMxWBkkIvMwkPSl40VZ6e5xK0
	mlP/I7keJzZFrn6jJ6TEwP9fZdsHGz0eU/7tTW6wQmpaWD0f2ntXqOsyVfkIYTKZkn8REQlT4UrNZ
	sOKTNqe63RpLgQGfJIAOSpSTKxnAFbNwELso0Al7QUH6ilrGk8t203EVb933kbco5f9Sqy107+BNT
	/Rbgk8m19e85HThJTDfuzWibaHI25I5SEvrvQJG1SAgnusAshd7f2BSTBc1yWL37ziJtH4vPadYBU
	oj4iq6d/99yJF3ETx0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVD1z-00000005lAC-2wKd;
	Tue, 07 Jan 2025 17:06:15 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCZF-00000005fD7-25Dp
	for kvm-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 16:36:34 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e549dd7201cso6223172276.0
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jan 2025 08:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=virtualopensystems-com.20230601.gappssmtp.com; s=20230601; t=1736267792; x=1736872592; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OK8Jcnv31loMLqAdnnCkel3HnQV+qA8hPIpa1P6/I2w=;
        b=0PsZqK5aSJf+TuDT5c6VMWrrC7STeTU3LPxuptqB+uO1Y5RIaKA4FlfDF82LdqfT7h
         jYCes2K6nde4ZBBHDmpVsVtezdfAmQSanhmXZFZICq9raoYMfbP1iJBem2qXcJL3FjDm
         7Z+pmFqTIeqTf+qLWmbHnwplDpuw63FJkS3Y70IZ/csfJ5C1/b2gGabk34aNHLtNMDPZ
         LCGKDTVSN46mM6dq/eNoyh7qWPGUilTGYEnE43ejGiUh7F/T00DHlbNavHVTAI9Hn/7M
         0svcBB2LuiuoC4sFK5m49dRe0p8INWBclyCUln/YfQIgyxWtC9g+sJhQ0CGNzqs9hr8S
         d4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736267792; x=1736872592;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OK8Jcnv31loMLqAdnnCkel3HnQV+qA8hPIpa1P6/I2w=;
        b=r8BMKN8Ofcf65A7UU3FqJSCPKxPDpxNdCEHXY8F+BTggQUu1kZZfgOq4P/kt4Sfc4s
         4Mw2U2eEJg27B4Bkd+kFVqylHR0AReVdggT2LJ+jXB3yfvT4ux5npCpSF05Nt8oCVDet
         MalOw87UIj/8iXrTfe28WyAkWZIAamkBifShjgedtXHzs6Wb35Comul1pvOWr0fy4e9e
         I7i05QT6iZngkoqv9wYZpXxDGMFApUVhgxq8rHbpiMZpS8ryzkt1gsWoPLH3dqYXYJ0Q
         yEIhEaaY3eBwvdsHZf7QybjD37QKA4A6++suHvVH1twFZm+dJoj2ex8abcOfruQ/P5CE
         IBOA==
X-Gm-Message-State: AOJu0YwR5XanUP9d+ZZU33/otTxChgscvxNz63VjK37lPGDtoqEh0GtJ
	LuP1RRRzxq2W6xs20Lgc7+wVrPC8wHKYnrMr6Gcdg2C/De33iP6Ws63FbOtlJ0wxHdKCpLtVU7A
	rjEwG8uRnOYmnCMv1nNQ9HzA74qAVjdb1pP/32FPVQ8BUyFlBSbvvsw==
X-Gm-Gg: ASbGncu8qGbVgTcZqL7Q3/wev3m+l/GW1qCAnK57IXHgE8HpqGbJD3PXe9I7h18LEh+
	PFdfwkooO/SE/wwfmgMPgxMYIBnvndWrnoydlFnf4iOKvLXoXCJkc6AubMlpeCn+LETW69qk=
X-Google-Smtp-Source: AGHT+IH86Z6F9G0K3+KUk3Y+3PHSw2yb2rBRCqIbmNatVbuzOHIu8FUaJcz1VMQyZwGRm2joSzKwGP67aZgMT3/C48k=
X-Received: by 2002:a05:690c:7003:b0:6ef:8c41:defc with SMTP id
 00721157ae682-6f3f8110733mr388077307b3.11.1736267792191; Tue, 07 Jan 2025
 08:36:32 -0800 (PST)
MIME-Version: 1.0
From: Samuele Paone <s.paone@virtualopensystems.com>
Date: Tue, 7 Jan 2025 17:36:21 +0100
X-Gm-Features: AbW1kvaGXJdNkInB0DCBxcLu_RqQG4m_82d1UEJ1LwGU5WLWLOeGVLCPROrWR4c
Message-ID: <CAK9SO09LZBL_tQpGX2f2PcZmEsSiaGcUg3yB6vGvQWWT3ze1XA@mail.gmail.com>
Subject: [QUESTION] Understanding in-kernel irqchip (APLIC + IMSIC) behavior
 with multiple devices and interrupt handling
To: kvm-riscv@lists.infradead.org
Cc: Alvise Rigo <a.rigo@virtualopensystems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_083633_536837_570E8E3D 
X-CRM114-Status: GOOD (  11.13  )
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

Hello everyone,
I have a few questions regarding the in-kernel irqchip
implementation, specifically in the context of APLIC and IMSIC for
RISC-V:

1. **Behavior with Multiple Devices**: Does the current implementation
support the creation of a VM with both PCI devices (that use MSI) and
MMIO devices (that use wired interrupts)?
If such a scenario is not supported, how can I configure an MMIO
device to use MSI interrupts? Would it all boil down to some device
tree configuration
(i.e., the MMIO device tree node "interrupts" property referencing the
IMSIC rather than the APLIC directly)?

2. I find unclear how the variable `level` is used inside function
`kvm_riscv_aia_aplic_inject` in `arch/riscv/kvm/aia_aplic.c`

```
switch (irqd->sourcecfg & APLIC_SOURCECFG_SM_MASK) {
case APLIC_SOURCECFG_SM_EDGE_RISE:
if (level && !(irqd->state & APLIC_IRQ_STATE_INPUT) &&
    !(irqd->state & APLIC_IRQ_STATE_PENDING))
irqd->state |= APLIC_IRQ_STATE_PENDING;
                level = 0;
break;
case APLIC_SOURCECFG_SM_EDGE_FALL:
if (!level && (irqd->state & APLIC_IRQ_STATE_INPUT) &&
    !(irqd->state & APLIC_IRQ_STATE_PENDING))
irqd->state |= APLIC_IRQ_STATE_PENDING;
break;
case APLIC_SOURCECFG_SM_LEVEL_HIGH:
if (level && !(irqd->state & APLIC_IRQ_STATE_PENDING))
irqd->state |= APLIC_IRQ_STATE_PENDING;
break;
case APLIC_SOURCECFG_SM_LEVEL_LOW:
if (!level && !(irqd->state & APLIC_IRQ_STATE_PENDING))
irqd->state |= APLIC_IRQ_STATE_PENDING;
break;
}

if (level)
irqd->state |= APLIC_IRQ_STATE_INPUT;
else
irqd->state &= ~APLIC_IRQ_STATE_INPUT;
```

Considering `edge_rise` interrupts, as far as I can see, the
APLIC_IRQ_STATE_INPUT is set only in the code above
 but prevents edge_rise interrupts from being set pending.
Moreover, in a system emulator implementation that uses in-kernel IRQCHIP and
IrqFd, this variable is hard-coded (`virt/kvm/eventfd.c` in function
`irqfd_wakeup` when it calls `kvm_arch_set_irq_inatomic`)
in the kernel as 1.

3. **MSI-only Support in the irqchip**: The in-kernel irqchip
documentation states that it only supports MSI. However, the RISC-V
hardware documentation mentions that APLIC can take wired interrupts
as input and convert them to MSI to forward to IMSIC. Could someone
clarify what is meant by "MSI-only" support in this context? Are there
specific constraints or implementation details that limit the irqchip
to only support MSI for virtualization?

4. **Device tree node differences**: How would a device tree node backed
by MSI interrupt differ from a device backed by a wired interrupt?

Samuele

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
