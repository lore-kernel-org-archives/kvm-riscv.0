Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2965CC02188
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/GQnUVFQ+PX5/3K1RhGf9FMXecPSPaqh8AadmGUuHE=; b=45UdEP7aLZB+HN
	Ym0ItfJjvBDAElelN48o2l0lcars/Y/flNEyoaG7vosJanuwRJLFm+z3qMXelmiCjhrSfC0L8n8LO
	7TEXS7qHI1ragVaJM1+sjHI0lWnjbjUaAYym6o7EPdAHUESrAzX+MO/98vkQ98dYDA0+ofltjfbBO
	+GHWzk0rlZGYvrMSmBMxZhYQlSfRg2bPWPxWLPcdg0Ytqw83YfVKYN1MeMbPTeyG+7IHFrZVlTpoQ
	sHKHFu2cmQdTteKbrr3O6GQRzL1F52T5Ha7K/Fd9SxMV7sI6T8AoalTj83H55iLspi/7G3W+VW9el
	JUZNanWMth8vE1429RqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP6g-00000002MSf-3uS9;
	Mon, 27 Jan 2025 13:24:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP6e-00000002MQv-3KUK
	for kvm-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 13:24:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-216401de828so77772825ad.3
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 05:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737984288; x=1738589088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xtw5uZR6yestfXGBMo34I3qkb2MJ1etd1jvG4X45hA=;
        b=XaNC1ASCj4Vws9WeIrGyeYmZY4msk5yrIedl/INbDBvaNBYPei7i5ywIWHNQJPjqTH
         nHlCXX7YUooTWl2tRMsnZph1e/b90EYRPt7xMgwWmecnR/9+hDCSJ2vnZBk93swbzOci
         Ei0g91UvHm6awwGXh8ceS88o9QtuC7zAn4qZybOLvex691GRUdmj1en6OF3T8cwTPP0V
         qmNge1EePb1+JZGJCeonq3zMCPJymyX4LhDl7VCOQ58ogP/iGyidftBHn18E/jRDCr8H
         l9yO+w5IK+1VtzNh3+8nrAgATrWdK0LEH9yXI7tP2VkPhvF8dkrD8mTIPii7Fn8bf8FW
         wO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984288; x=1738589088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xtw5uZR6yestfXGBMo34I3qkb2MJ1etd1jvG4X45hA=;
        b=tguIQZgdW69ixG7Q3+vwdoxv7tnKxv/znjhVY+lOR2ZoCAiWDzuEgdECkCoOA4uRpH
         FSh+ZIC40q2kFTWmJ/To4KSJRj8FY+PCNZ4rV2KJQC4eLKgA0ckwJhQ/jqPJvwvu+ULk
         3o9w/ub804cLdmUR/mZU8X6mIV2/he5Ao7zfYl33r6cwbpuJ2V68Am64rLzjMVB5/1QQ
         bR9XKi9snLZntg4p2rDAlbtDcEr5UZw2Ix7CgMDYl7tiM+87wnNLitijf1KkqxmGWUz7
         oCFMVDpuVQyrmLBuHNvFV6NGBH8eRL+tSB9fofDoVUMUA3RY0nQbsFLF0eE2kiSHwH0I
         n0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCX/c7muGopTFOdppnsWEo7pza7PF/mtc/J+MCrg5Pla0tQdCUdYcz09Eys4xYZeHLc6kki4H5d3CF0=@lists.infradead.org
X-Gm-Message-State: AOJu0YykNIg6HIFwmuxdWrdslig9ZBaY3aE0GyKaaQ+IK6vAUeLef+yG
	JXNhiOyLiCXUscWnMYCNmrMAiqUHogoYdWVzI1IakPVTj7tjM3zXW3J08iZB+Go=
X-Gm-Gg: ASbGnctpInhTwEFdJ1GTn4m9t9JYEwbebBsGivPCQ1uxIfsoCQ86wQSu/Nwm0V9aOXJ
	mLoSMMVNuh+rLOTKDriuL18vgbjSpavsPAhylgZQIxmsfJ5QcckDY3QK0zv/q1MLykAhH3DLwYi
	1LoFrDbLhZa0uhRZ4J+mINLPUmuN8klkfHfcZoqxNIACnpzYzPDreqJJORIrg68oMEEWF/zrhrz
	oOAvO6DL2+5hCI8ORsJHKAwxADz0zVjRegfpRn4lazX49eEBDdmg4GWpY5hkDynh7YCspnPwSud
	OPEEjKCEXQoYyPDx+cwSmKBF0HOD8VoyS0OiJUBtI2Bg
X-Google-Smtp-Source: AGHT+IGLbe7E4P3Z6l8sjXpD25QC5kWy8u2IACPAdHUxgjERIJURZuTOxMhW2ArZVuocc/wEWDWWpw==
X-Received: by 2002:a05:6a00:3a28:b0:725:e405:6df7 with SMTP id d2e1a72fcca58-72daf94858dmr53566206b3a.10.1737984287885;
        Mon, 27 Jan 2025 05:24:47 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b324bsm7268930b3a.62.2025.01.27.05.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:24:47 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Will Deacon <will@kernel.org>,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [kvmtool PATCH 2/6] Add __KERNEL_DIV_ROUND_UP() macro
Date: Mon, 27 Jan 2025 18:54:20 +0530
Message-ID: <20250127132424.339957-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127132424.339957-1-apatel@ventanamicro.com>
References: <20250127132424.339957-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_052448_836773_9CF6A1B6 
X-CRM114-Status: UNSURE (   7.01  )
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

The latest virtio_pci.h header from Linux-6.13 kernel requires
__KERNEL_DIV_ROUND_UP() macro so define it conditionally in
linux/kernel.h.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/kernel.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 6c22f1c..df42d63 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -8,6 +8,9 @@
 #define round_down(x, y)	((x) & ~__round_mask(x, y))
 
 #define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))
+#ifndef __KERNEL_DIV_ROUND_UP
+#define __KERNEL_DIV_ROUND_UP(n,d)	DIV_ROUND_UP(n,d)
+#endif
 
 #define ALIGN(x,a)		__ALIGN_MASK(x,(typeof(x))(a)-1)
 #define __ALIGN_MASK(x,mask)	(((x)+(mask))&~(mask))
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
