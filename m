Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ABAC83F25
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 03:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQe+CEIzwE4zpWrgGqC/RVtR6IdNaHYJYhx924DC9P4=; b=yDDX5gEdwCe6NQ
	3pzQy2QGadH+YiFvgn6t2QA+UPJ/+UxEIdnbBCrRrHFmW2vc1pDvWz0U+WUzGvzVDL9GzlrdsS7nT
	LJwUejn7RPQwWERaioRc5dlhnLXGxqVwdc3jU3+MmFxNbvAUIpVypXvrAIKb0iusoA8y18LTu/OiK
	kuYNUGj/VlxoFI2MZypZqFhvoqguYu0yrOtOEjLHwBgvgdJBzm4H/3tVdIEPyEPg9qYwYifNo6l21
	4i79RNepPXqyubXmOdlGRYxAWbQQ2mLb+s9+/j8XrGkhnW3qCMhLefLUHzR7P+HUfnelQkGfEHaN1
	oJotdVdmiEjqyIv+DeJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3az-00000001AK5-0gYN;
	Tue, 22 Jul 2025 03:23:13 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TV-0000000195T-0Ddb
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:30 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-74af4af04fdso4186915b3a.1
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154128; x=1753758928; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=;
        b=a9nHU45+nYTPoIqgOkeRMxPYx4r/xNdhxCkg/9t7h8AI2La+8r/6V7ypGNsTQlC6yB
         2pb86JS1Hglh4+JHAi8ukuu3DP7Qf7HYgg4IhXSvHqjBL48qgkR7uQjangT/yevzhb0Z
         Cf+jH9SksZR7xN97FxF/s9PMl682gQPFldW4tsPGuuhdGKKFj3WjPa7M4Rswv/zwXMyA
         HvfwdPyzcGGvUrbFKp5yMtBy0LAseKCLa5JMUWgMCKTmbTYDP6ZZNnRAcdD5teIkNf9I
         ddqq6avp+715VCV6DVvjzgre1BDoHOObdHmlt3MnpSVNgrxj42kteDMhppCB7fwYqY8U
         ArhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154128; x=1753758928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=;
        b=NKgC4cwNnodE3JfSX+r6dkzyHGjsTslDGF4KX0IQtzwr+bQvcAovg3qwZwNSgNXLUb
         CQiI62smLFTFP6Os5byyO4rjV033O5pjtdACwI0Qi5sf958cV2YX7iC1VS1XGVLNIj7f
         89jy3HsGP5/m1wgp1xRELYYPErs3KUxPxnIud9S2i7w9yTMMas0S/u6N7sKEXzZdFtfi
         Y69mccZYaTtHVhWPf1uwV6r6cQj8ghlGT+OjwFm3MohQbW7BjeMqITgmmlOcSFilRvP8
         OI9gIrC4IYD6WUas9RqvWlJxguTUXjk6F+ZkX/0mYP11JNhXhJRyRIJm62ToeeJNpWDC
         /9yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcf/Q5rw7vDE8or/CQLti40HYw3hG9JiOPXrNrFrFh0WpuW4OY5Niyegttdha2oWqhDqKAD7QvAps=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsejGALYjNQzIKB9ZCd4VOxM/fLYO9VKazuYELxynTUXSuf9xv
	nUdlkcg/mEtx6Bp3heAn5VJ8TOOTV2DHYE6IAXghIS9QlAJYPQ4agNcOlcwGvMRkDRo=
X-Gm-Gg: ASbGncsGi6C+gz66LJ1e3OmXk53yDaWUwOjRRVOs/ovkiJ4R0rUEoeaQR32R7Ls32XV
	BW8Y+QRfFfipZ4ij3/8C/CUidiYcxoTnf1ANPZ4SERtv+JefIF4Yd8mzllISaLF2axt3Rodv+Zr
	jSxy0abmWf1eW4LVCxtn/Bf+N2Tr3gUpGtkej/isxLzgAX8X7lkcCGmjUHFMa7zfaOK/b9M8ROz
	H5YhyB1JNs0jtko4+QSlCsR39aw3OARSRamue94+DVK7B/UzkB+FQDzPlW7G/bF8Ya4dL8qbQFm
	tyMdEkYNsuJlutjcCkVpRDm4wYdxTPAGs1FBaU3thMZQM4vF7bq2FxzHD0VXhQmD00HaoMUA++G
	qvl681De7tLJItumNFR2SZMOfRACYAGkgUq8=
X-Google-Smtp-Source: AGHT+IHQyL4rtGfOdMFXQZYZwkkphmY+Xgv9oIObvrdf8R89tWOPveRkw6OvWr9uZxH2fTwJdfujLw==
X-Received: by 2002:a05:6a20:9186:b0:235:7452:5867 with SMTP id adf61e73a8af0-23d37d7e90dmr2717183637.20.1753154128287;
        Mon, 21 Jul 2025 20:15:28 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:28 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:19 -0700
Subject: [PATCH v4 3/9] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Message-Id: <20250721-pmu_event_info-v4-3-ac76758a4269@rivosinc.com>
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_201529_133460_DE18B277 
X-CRM114-Status: UNSURE (   9.98  )
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

SBI v3.0 introduced a new raw event type v2 for wider mhpmeventX
programming. Add the support in kvm for that.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 78ac3216a54d..15d71a7b75ba 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -60,6 +60,7 @@ static u32 kvm_pmu_get_perf_event_type(unsigned long eidx)
 		type = PERF_TYPE_HW_CACHE;
 		break;
 	case SBI_PMU_EVENT_TYPE_RAW:
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
 	case SBI_PMU_EVENT_TYPE_FW:
 		type = PERF_TYPE_RAW;
 		break;
@@ -128,6 +129,9 @@ static u64 kvm_pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
 	case SBI_PMU_EVENT_TYPE_RAW:
 		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
 		break;
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
+		config = evt_data & RISCV_PMU_RAW_EVENT_V2_MASK;
+		break;
 	case SBI_PMU_EVENT_TYPE_FW:
 		if (ecode < SBI_PMU_FW_MAX)
 			config = (1ULL << 63) | ecode;

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
