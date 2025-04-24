Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C34AC369D8
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PdYgjLn8gm0MnLv521XdU9oAEEvRCj1f8Ps8U0ocvLc=; b=jjG50HgYhGLvD1
	Yhg8LBpUggWCzMWEPe/aVayViDMj6WBgCN9D+ijUHMA/52B6uSAtwdzWdT48iIz/ev/c0WrOnOxFc
	wLpgp3eCX9PokU8xUx5OVsHFRfFFFIm3eOxLslCaN9YHLJJiPrh4e6pyZzalh+Zq9gNTQWG7AvW2V
	DSlliOB8GujwGE3Hwyzk19f+XVSGi3y4M5q/Eg7Jee/I/Rnh7vClCjFG74p3W8huTL23banlCFtNW
	ZMKtrYaOKseO0SbXp6795SvqEc4DntO223tQVNvksNsiq8QqFuOoXQDfzKeaPr232L3NVLSc+xZaW
	/tcXrfIZA7dmzlqN+nvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6p-0000000EfcY-1DDW;
	Thu, 24 Apr 2025 16:07:31 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yYb-0000000EVCZ-2kNl
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 15:32:11 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-736c3e7b390so1213111b3a.2
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745508728; x=1746113528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0oClxd3Eqcg8INMrYeT0VTSG7eSwzuIOPz2EiOMFj4Q=;
        b=fbqDhgeWcQMQRk0kCZzULTiSvcXgzBDQEn6pemeQmWRKsQJe7D/8sPWrId2/MXpBxS
         LKgrxUFa5X08NfKphg4M9ksQazhLYWwldb6kuzaj9CzsrnoHmeHVAcyNFPNEIpVvvEWq
         rxZAAqlNFlWuWEKHRcEtW9f7ILCsQ6zJk3Ax6ofEmD6eVk+JSAAaCIeoySnbQzFzYpLQ
         2ru8Yxh4WhafBSVlbfDHFnFuN7OczRPFM9mavEVcK5x69hM45KUQcwPX69M6fKMiKipg
         doAYA5vxIDkevczqA1CaTlzzeORlz/f1epEuuhuqYRxCCdQWjrBtULYGEusaJIgkoOyb
         ft8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508728; x=1746113528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0oClxd3Eqcg8INMrYeT0VTSG7eSwzuIOPz2EiOMFj4Q=;
        b=dQkF9+SIWwVvS5s7pdXp5Dc63QzX//IiSf7+V+b27EIDZ7C6AE3XaKXnXXDSHW/V2/
         BGVDMStCyfzoV2FMU4mqFxIDTz19DBS1nz1JP54/P6KwKRTlF5y2qmRJz/zhdrxeLxMF
         hX/EKLjVf1h2AY7SYsl5tTSSvkdvoiD2fSYxVh1w4tkbFlSxLwaAz06VF8jS5Tklxf6t
         Os4PXSdYN437oudn9OPq83HthPNhWEL3MLdXLZztQRmc8GaXeUBCKScPcbjfNKN6u//P
         HNjBwuPpb0TarGJ1Ci8UT1IkuormvG7pahr65IJ7EGkjja6U0MBf2AGz8Wu7xzj72zfc
         9KHA==
X-Forwarded-Encrypted: i=1; AJvYcCVz7YqLI7mJoUtK9qn+GjgJeswz/79BBE/PL0GNcJnv/EsfeIyYcV6dbb64QroLvqZ0XsIZnl78XwQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBiLioQoszhlSi+HxYho8bwHaNi2zzZ8zXrtqfYSMqvD1WTwd/
	16LQFfeZghwPSe3c2UQobgOo0bqVBuTOlgRpiDKD93qUYYkH6Qpfc2hcrO76Y28=
X-Gm-Gg: ASbGncujh1ff6gWpJAZ4cB54XJZvp/Ib0B76o8MJpSJxMQhiFvK9TmcdLrIVugmskeT
	Cffkf+OQx3RYO/4UzrjIEvWedLjNuY7SVwhEtiFabWduFLsLnRHAhrX1bslRu/kBbLV1HfQgb8W
	A+zILMO5hJQEK0mBYVGY7xHwrudXXFM6yETZ8dFPUuxlHBv2NSf9hJulKmFnI3aF7SKvA/EJygW
	YNQXcIaf0Nk+/zzwTunQhjn8lPsJTqUyTR2n/zPeXQGKq7vDowkCU5zvb/WC7+KcF0pxo3RtWrA
	FZefP5uHSwx8g6gmLGqS0ff42zP16pRzZQy7/Kr28PCaWg6KvwaFvp67yTpp+nULKXden5Xa0IH
	/b8rF
X-Google-Smtp-Source: AGHT+IGn2lMxrkFCENEf07ZZ1qMSmFt5r0YXLBuVTZeTQRd8e6liRvutCssLcoZZasc3BOr9s7qAbA==
X-Received: by 2002:a05:6a20:9189:b0:1ee:8435:6b69 with SMTP id adf61e73a8af0-20444e7ac6dmr3777420637.1.1745508728437;
        Thu, 24 Apr 2025 08:32:08 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597f5csm1360610a12.43.2025.04.24.08.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:32:07 -0700 (PDT)
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
Subject: [kvmtool PATCH v2 00/10] Add SBI system suspend and cpu-type option
Date: Thu, 24 Apr 2025 21:01:49 +0530
Message-ID: <20250424153159.289441-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_083209_694134_A8368F8B 
X-CRM114-Status: UNSURE (   9.51  )
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

These patches can also be found in the riscv_more_exts_round6_v2 branch
at: https://github.com/avpatel/kvmtool.git

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
 riscv/fdt.c                         | 241 +++++++++++++++++++---------
 riscv/include/asm/kvm.h             |   7 +-
 riscv/include/kvm/kvm-arch.h        |   2 +
 riscv/include/kvm/kvm-config-arch.h |  26 +++
 riscv/include/kvm/sbi.h             |   9 ++
 riscv/kvm-cpu.c                     |  36 +++++
 x86/include/asm/kvm.h               |   1 +
 11 files changed, 266 insertions(+), 83 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
