Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946D9C0218A
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 13:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ry2loLa/id8KK3y5yFviEoWwIg6NNzIKP6Mm4vipIT8=; b=ixvNpj+zV4sg/s
	rnmE+51gKwwdp1bqT4YbWL0Gx2BAr7a2k8WBP6xfCWpvk52SqQI4zjja+QgRD22fPnZzscr0U/kGg
	fvsqyZRfcO7XuJzWTS7WcQ1w/pQ9rmUq4wM+OyiL3OYb5fFSSuFOsD9vwITmWO8wS+VEQS/vS4XX4
	6+j4NHYq8zkPJfERrDayoqAKkLUK2ODH0HDph4NlIXyWj5eCcTDqZeVmpIIQbgWFeccWGe9VO6EMA
	5QrjeNGC1Lxcnmqddydcqf+fWOnhVcmvcEkj9uFPJVY0FXffAJunW04smi3TOc3DqZtEGxOUJj/jU
	EZEKWx1ZyMOqw9la/vwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP6Z-00000002MOH-1Gpe;
	Mon, 27 Jan 2025 13:24:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP6X-00000002MMh-0pBk
	for kvm-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 13:24:42 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so7547447a91.3
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 05:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737984280; x=1738589080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUXaN0scouSUrZkXTp4+p8k/tO1/dvAg4qHYedENdVI=;
        b=n98gyeW6C6/vxv2qPwer8FmR6AKcE/yIkuMGTS11DyXSrwcOF+UR6fUJ3eoBMnIcW5
         RbpBY5+PKf+hzdAYckDOnNWo+eXECltIPxeBFmjj4gZsq9QhQhGiUKMghuUcfRgtQVPi
         FgfpczCmelbwe6P3gDtcsAJVxDUfIXJ44Djf5DEwK+0z6mkYhhT97MT3HqoUm9vYr6Yu
         1GsY/+GAb00XTHSzy5JjZnb6wVsNvhjBNxLx49HvBjEl9XG7+4hM8mf0xXh7aKzjTMuG
         drphwNGiGPEfdZvIwHLXkeZP5ZPr1gR/3UwssAR+bhjJ9023GcW9S1HwuSKhEPBlplzg
         cvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984280; x=1738589080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUXaN0scouSUrZkXTp4+p8k/tO1/dvAg4qHYedENdVI=;
        b=T5uDMnH3LR+wVvK929muRIG4R5EFbsGjjMcVGgX8XgZ/L+UJ1UNMEs24+GZZWjgjmk
         ZkKNJgPY2c/OYdq9PR38HAJJkyh2/zUIpwZJzANY8NlnfMhCxZIJBREeDyT0jprY1/6m
         ImT+mZBSzJEnhifFricW8/S4wV+INEDhlEh0d0yggO4fzWaedM8ccX/QUTqv6uubDAtF
         aR1i9E7t49LiiUscG65GOv0fU7fu1rLHaz8uuPa8YukXv7XdWjAzZJF+i4PZrGFFS+pF
         NhTMNCPJl9XrBe211aNfJImksyiD1ptefUsk0pq6UFX/v5kX2F8mgNK6aavXY2vZ7BZq
         TJsA==
X-Forwarded-Encrypted: i=1; AJvYcCWzoVJ4/blD4TKFN0YAgH04mM+ZGL5egTCbsbCLqEmwJVZia+fnmXy+VkDGiVvRcMH2L8dahlaqeDs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHpM3RlHKMxasYUwcGgCvuvnckTeO+oTQdrRNTPTCU8bbdWDBl
	J/4kWp2FuZHc2pjRj3hqiKgcbKEq5A87ZOh9c10Q3dpIZdujf38xRdpR+K6EYt62+6HeJ4MBg9j
	B4rI=
X-Gm-Gg: ASbGncvk7n7sc5svmhCFbXQsVqNr3akxUncP20cVzUhztoPM8dyXHmL7OF2+otIYH5p
	7RBje9PpecbTmoYkstn5Z10KE0VPjc3zRjHccbWcMRh9KUD73o2F1QxvlrEWDth9NNbRtJC0b20
	7jV2uTbCtGWzS0Mqcj6laPZCgIVMOl0W0HE7IczrrpvzkVAfVORkk7GuqUVuR51uUDnMzt91/Fn
	x+n32x7+xzI4uJLUSQ0Jm2VFUpJhmOrmONDWfnYwpa+2BsTFMhvhkeThzchFgjI6JYe/cn7bb8k
	P8wsZHCmQzPWltXfEoRByNgjzu+B8PQyxLwt20k4CfcR
X-Google-Smtp-Source: AGHT+IFkZeqpNSFIDBBZPwRSd12WNh4znlJPrXn1Gu2GGxftAJrkQzrZSGZtNCDW0T2AdYIKAjST1w==
X-Received: by 2002:a05:6a00:3c8a:b0:729:49a:2da6 with SMTP id d2e1a72fcca58-72daf9a6d2dmr62760073b3a.3.1737984278427;
        Mon, 27 Jan 2025 05:24:38 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b324bsm7268930b3a.62.2025.01.27.05.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:24:37 -0800 (PST)
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
Subject: [kvmtool PATCH 0/6] Add RISC-V ISA extensions based on Linux-6.13
Date: Mon, 27 Jan 2025 18:54:18 +0530
Message-ID: <20250127132424.339957-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_052441_244209_4F9AA9F8 
X-CRM114-Status: UNSURE (   8.91  )
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

This series adds support for new ISA extensions based on Linux-6.13
namely: Svade, Svadu, Smnpm, and Ssnpm.

These patches can also be found in the riscv_more_exts_round5_v1 branch
at: https://github.com/avpatel/kvmtool.git

Anup Patel (6):
  Sync-up headers with Linux-6.13 kernel
  Add __KERNEL_DIV_ROUND_UP() macro
  riscv: Add Svade extension support
  riscv: Add Svadu extension support
  riscv: Add Smnpm extension support
  riscv: Add Ssnpm extension support

 arm/aarch64/include/asm/kvm.h       |   6 ++
 include/linux/kernel.h              |   3 +
 include/linux/kvm.h                 |   8 ++
 include/linux/virtio_balloon.h      |  16 +++-
 include/linux/virtio_pci.h          | 131 ++++++++++++++++++++++++++++
 riscv/fdt.c                         |   4 +
 riscv/include/asm/kvm.h             |   4 +
 riscv/include/kvm/kvm-config-arch.h |  12 +++
 x86/include/asm/kvm.h               |   2 +
 9 files changed, 184 insertions(+), 2 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
