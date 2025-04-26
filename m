Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93870C369CB
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 11:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YXetmdhpETHn6qfqq6C5u4By6D72eZt9qD3pkhhti74=; b=G9AlaeIfwWRyzI
	qtmSImGLVzZl4tijdQDb/4obYzG0eVYYqZKxUdUiKIfiU5/3C9roPXWOQZ6yuhKaK82OFsaKX6+7L
	uagPFpmeRoIjwm3oIbWpZre3O6VHXTsyzr2uoMIUmxIAMNl9mZgr0oaNBO6qTANBEOnuRtXLCATx3
	x4ywM0rwHmbp559PNeSxLEnmbDgT96Cw+g/rJBPMN54Jt0wLhMezI6W7X7923DVVaOtCPAXbSJQ3y
	OXfUHpWL8SCcUWYgEK3GcKmdic6rE/LvuvfyRgKErl4IdUZSaeBhc2vO1P6LUxi8ZkkrLAH162vN9
	4yEZcPpI5F6eK5Y7tJnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKE-00000001toz-1GgX;
	Sat, 26 Apr 2025 11:04:02 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKC-00000001toa-0rzR
	for kvm-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 11:04:01 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-223fb0f619dso35599915ad.1
        for <kvm-riscv@lists.infradead.org>; Sat, 26 Apr 2025 04:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745665439; x=1746270239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mcoBwM8KJxhwkXcnebD3xKE1klc/hF03i5YT3vBn/hY=;
        b=RgY/I+VhH3UQVSbdOPSy8OhR8RHoqBTitGgP+8nEwozi4uIRItKudXOWszh4U9lxYO
         wKjAO8bCihuGQ0dL0NTm5f3O9aK5BCGFP2ltRoPWcYpZvxt9wIKid8w65ylSMhnBW2mk
         DUR05EzXZqwd2aLxfq1CxTUhKADvkMBZGHwrlN5uiCWfIzC+bixy2tv7A6a7Fu7sjOl9
         tjps3k3mvjUPoKjJEclXOMD3yk9Er6rm9StEeqKtk/gCYdHbHmAQAgiqguu2nn8Qa4OB
         eVv+gtAZN6Vw48xxDdaCzDP6ejv8FLTMIKRg9q4pAHBbmOTBKEGUQWofHCao46N9E9KP
         JOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745665439; x=1746270239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcoBwM8KJxhwkXcnebD3xKE1klc/hF03i5YT3vBn/hY=;
        b=scelAEpkF7Z9HukXXjuIIpYoF1adcjOuTpalRA12q9ZH7upW4pJtXjKg8xFyciYhtI
         9AVzHrp3awtY9L2J204kdCCg+2T5fhJ5jEkdIewECgtWUAl5bByCkeIxi+YTqLZk+F2m
         jui2sDrLBxDcDHhMH16hBwaGAtSF2mvfbw7vnOTRRdWokpTLy3Q8fAu1r3q4WH/cp7U2
         fgssyb2nC4ypYJ2ttCTul3ghXNKgRi+QHaCFseszIkGH/ATY0hXdF60JawZHg+omNxn7
         5dUZ1awmu3q/ysLSkNUje/2HgKAepDFx0sxfzvR9E4ykuZF2Sk5ES/xNhfQq8tV/p6VI
         hrCA==
X-Forwarded-Encrypted: i=1; AJvYcCUCgGCSshwxwNYCMHRybm/VmYdWTIH/x43J6VLAt1ytV0CvBq4nagbtRm9uYljdhR1YMAbWwPvjHzo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfBHiOwtrL7yCuD3YvxaCVnBM/RO1WkgWqZong50WTySjsFyZo
	P45lvs3dPwcpORnkGnZiS8XutNOia1BScA51ho4801pkI46T3vhKvThvhi8jIF0=
X-Gm-Gg: ASbGnctgYxlVWVsMLDexQVr2RpikDls9T8UsVL0uLszfyc+YUJmO2gNEDwOYGS/1Ssu
	gOZ595qIWIluzkIbHuXFMZCerPurqYemqPXdYeSfoL9w4nKvyf0HEAxexnGpNRCXUvOfFYa0kP4
	wqrOBtU90DzdWXsCQT+QBIQ1q47pc9SAKclc8vjm/P1B6pTqkFEtzIoB3RhrA9t291uWAMF/Ls7
	i+fgCBqd2rLLU5g+libM1KtHvV1/zfASgqPv9jEKoatXiBKvxMbOTQFCNXkHJp89ak3H17degiM
	TzS7HsD3XYbLMApFJUeO2NinLuM9lzzgOB4DwzY4tb/C9+fyZOM7tlV3fLBpl82zibXGY0uBRrD
	s8dO0
X-Google-Smtp-Source: AGHT+IFXsiCw6Q4lQhwQgknZZbJY5BlIlkPcP5A9MUp0n1Tdm8Xe74w70rAnDcwYIU5gkiN5GSXDkw==
X-Received: by 2002:a17:902:ec8e:b0:224:1c41:a4c0 with SMTP id d9443c01a7336-22dbf5d9ecbmr73907875ad.9.1745665438966;
        Sat, 26 Apr 2025 04:03:58 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc8e24231sm10956725ad.125.2025.04.26.04.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:03:58 -0700 (PDT)
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
Subject: [kvmtool PATCH v3 00/10] Add SBI system suspend and cpu-type option
Date: Sat, 26 Apr 2025 16:33:37 +0530
Message-ID: <20250426110348.338114-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_040400_249316_174932E5 
X-CRM114-Status: UNSURE (   9.56  )
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

This series does the following improvements:
1) Add Svvptc, Zabha, and Ziccrse extension support (PATCH2 to PATCH3)
2) Add SBI system suspend support (PATCH5 to PATCH6)
3) Add "--cpu-type" command-line option supporting "min" and "max"
   CPU types where "max" is the default (PATCH8 to PATCH10)

These patches can also be found in the riscv_more_exts_round6_v3 branch
at: https://github.com/avpatel/kvmtool.git

Changes since v2:
 - Addressed comments on PATCH10

Changes since v1:
 - Rebased on latest KVMTOOL commit d410d9a16f91458ae2b912cc088015396f22dfad
 - Addressed comments on PATCH8, PATCH9, and PATCH10

Andrew Jones (3):
  riscv: Add SBI system suspend support
  riscv: Make system suspend time configurable
  riscv: Fix no params with nodefault segfault

Anup Patel (7):
  Sync-up headers with Linux-6.14 kernel
  riscv: Add Svvptc extension support
  riscv: Add Zabha extension support
  riscv: Add Ziccrse extension support
  riscv: Include single-letter extensions in isa_info_arr[]
  riscv: Add cpu-type command-line option
  riscv: Allow including extensions in the min CPU type using
    command-line

 arm64/include/asm/kvm.h             |   3 -
 include/linux/kvm.h                 |   8 +-
 include/linux/virtio_pci.h          |  14 ++
 riscv/aia.c                         |   2 +-
 riscv/fdt.c                         | 240 +++++++++++++++++++---------
 riscv/include/asm/kvm.h             |   7 +-
 riscv/include/kvm/kvm-arch.h        |   2 +
 riscv/include/kvm/kvm-config-arch.h |  26 +++
 riscv/include/kvm/sbi.h             |   9 ++
 riscv/kvm-cpu.c                     |  36 +++++
 x86/include/asm/kvm.h               |   1 +
 11 files changed, 265 insertions(+), 83 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
