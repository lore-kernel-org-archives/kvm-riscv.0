Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91D3C02180
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+JmVsLgBxbp2cFbxXzJ9fRRW8zQD+VjlsrWmHzagmM=; b=hSsco9fXPpKhM7
	C6Feyfx0LqGAkU3NK+YkU98LqczMLttIQWEh08Y/ABaW3Tj1OiPcEJ6DPLQvtsCWzuwrNxafgnHkP
	9Jp6J1YRsac0CN77PWklliVkkraxS3hxxxSBFHYgf36lIvWB1Xj81WtgoFsNJsWOjMp4w6HnKhpnt
	E0fdHVts4bzHWL3NF2RxE98vah/Kg1hOxgLvFRaFgLNE7UgtFIAwdIq70ARfAvN8clTrQ9e6O6bgE
	Ukdw/A/AGsYbZ9W9KQdSAivFx4fMtAMquPVPIVP4kPYkLQh1dgi4hLMej+O0qrY8WC03KXdKzLVKn
	SN9wwbVDn5dG5XM4E3dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8My-0000000CoCN-2Mh7;
	Wed, 15 Jan 2025 18:44:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AT-0000000ClI8-0SLv
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:07 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-219f8263ae0so118871005ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965864; x=1737570664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvcM8pFAUo8mVZOX2xDK8xE/vCf4z0GzB3iMLovGRHA=;
        b=M9W09/dKxI6LTQas8wJ64Ut2YHTk7Lf4hfud8ORhJV/3znMghwTMSKmCS2zEzfJlWY
         uYc9J5fBYTtkXeE8Ht/d696k4Rrp9lazC+H3qleknHJjvSygPy3/oM0v6xIjSA5ZzDAi
         tQPXG+A/z+cvU2Yg8t0fnfxK42cWb6ildgeMId4+mCmxTl5am+PiFEcK3IdJ5n1eQLRN
         YwIJaVZHP458ilWG73D9xDbDaeqmxnDcfGCSmvSVpLQJkcJhNr8KXQljy4TfbSmA03Co
         tbQThIfcHafI1rhsqskmJv1fiZqEdkxGWBQsEJ8SmOAemqXju7vKoT+800gP+qRfizHU
         cu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965864; x=1737570664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvcM8pFAUo8mVZOX2xDK8xE/vCf4z0GzB3iMLovGRHA=;
        b=ElmiiD//RYP2GRxRqq2lPQpSiksw433ZD6o8nD7PAY+LU/BWrV2DZVksQfiMjgrz6m
         rm+6mAWDJ+Rg/Q3ajgOGLbp9GayzPBlUVty/zBCJXvcXS/QUBeGJaG68ODkL2TygaGWI
         +k6yGKLZZT76uzv/hzwA3us4DOeMVTpQ8nSIxgnJZjuIM6Co4/NV8KtiqDJgiJ6mOHy6
         GYXaFWnkr7taiyXEsMa3N29MWA9WV3ixFuMI0REjq0H3neuKB9PeuqxnNN8Xt5B7axdt
         f5DCFyHEUeyrkcrK2pInKbwkkt7aCYmojJy6PrsGyt+SFjAxTYMxjSgRf73G46A5UFXg
         AMwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYW40GhU2ElojbgQIZ6j5Qs9wnGkQi07Q0bXxXJpFKbe3oEx/QqcvmhHMlFJb/OobwS3vcZe7DZSI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpnxzYP5QnSxiXWZw03pgPP6W5/o5LkKYm8aFK1griyWEVCu4R
	FsiAVwNIsdpNo3cdzOmVKran0EAgCkVr+y9z5IWk99LJjLTkAPx3y/kYmd/No2g=
X-Gm-Gg: ASbGncuG5IlpiIV3q06sn3N7wXKmyZIlFXam5D8EjyAHZii7FAXijQlugl8br4ffGZ/
	dvJRqeN5JoTPDdboiwWI6QYU74pP88+QcVgi0a6VfwEXACZr+/3D3Ywg/r9qLtSx30/iiUm7K2s
	lYu7xVoXCPRA5ERmO4Lyduw0tbSgGIweHKB5nZhR04mH0zuyFR21ETqtc6HEql7ISRPZznRHNfO
	FAvljLCNn8x1iMsZmIpR2+D4j/e+N7uSdpFzFCqRwTpulktrpz/8joPwzLLx92pe8g3ww==
X-Google-Smtp-Source: AGHT+IGGezhqE5JLeDYHWhClhyZY1cGsFLOXrLsdEJgU2ElrVE/deMFlurFTVr/XKSOcI7Wz9ZYvgg==
X-Received: by 2002:a17:902:e5ce:b0:216:386e:dd8 with SMTP id d9443c01a7336-21a83f54a51mr373139315ad.17.1736965864561;
        Wed, 15 Jan 2025 10:31:04 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:31:04 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:48 -0800
Subject: [PATCH v2 8/9] RISC-V: KVM: Implement get event info function
MIME-Version: 1.0
Message-Id: <20250115-pmu_event_info-v2-8-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103105_171176_86B11A6E 
X-CRM114-Status: GOOD (  15.02  )
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

The new get_event_info funciton allows the guest to query the presence
of multiple events with single SBI call. Currently, the perf driver
in linux guest invokes it for all the standard SBI PMU events. Support
the SBI function implementation in KVM as well.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
 arch/riscv/kvm/vcpu_pmu.c             | 66 +++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_pmu.c         |  3 ++
 3 files changed, 72 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index 1d85b6617508..9a930afc8f57 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -98,6 +98,9 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long saddr_low,
 				      unsigned long saddr_high, unsigned long flags,
 				      struct kvm_vcpu_sbi_return *retdata);
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata);
 void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index ca23427edfaa..23dedf4c9313 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -453,6 +453,72 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	return 0;
 }
 
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata)
+{
+	struct riscv_pmu_event_info *einfo;
+	int shmem_size = num_events * sizeof(*einfo);
+	gpa_t shmem;
+	u32 eidx, etype;
+	u64 econfig;
+	int ret;
+
+	if (flags != 0 || (saddr_low & (SZ_16 - 1))) {
+		ret = SBI_ERR_INVALID_PARAM;
+		goto out;
+	}
+
+	shmem = saddr_low;
+	if (saddr_high != 0) {
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			shmem |= ((gpa_t)saddr_high << 32);
+		} else {
+			ret = SBI_ERR_INVALID_ADDRESS;
+			goto out;
+		}
+	}
+
+	if (kvm_vcpu_validate_gpa_range(vcpu, shmem, shmem_size, true)) {
+		ret = SBI_ERR_INVALID_ADDRESS;
+		goto out;
+	}
+
+	einfo = kzalloc(shmem_size, GFP_KERNEL);
+	if (!einfo)
+		return -ENOMEM;
+
+	ret = kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_FAILURE;
+		goto free_mem;
+	}
+
+	for (int i = 0; i < num_events; i++) {
+		eidx = einfo[i].event_idx;
+		etype = kvm_pmu_get_perf_event_type(eidx);
+		econfig = kvm_pmu_get_perf_event_config(eidx, einfo[i].event_data);
+		ret = riscv_pmu_get_event_info(etype, econfig, NULL);
+		if (ret > 0)
+			einfo[i].output = 1;
+		else
+			einfo[i].output = 0;
+	}
+
+	kvm_vcpu_write_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_FAILURE;
+		goto free_mem;
+	}
+
+free_mem:
+	kfree(einfo);
+out:
+	retdata->err_val = ret;
+
+	return 0;
+}
+
 int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu,
 				struct kvm_vcpu_sbi_return *retdata)
 {
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index e4be34e03e83..a020d979d179 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -73,6 +73,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
 		ret = kvm_riscv_vcpu_pmu_snapshot_set_shmem(vcpu, cp->a0, cp->a1, cp->a2, retdata);
 		break;
+	case SBI_EXT_PMU_EVENT_GET_INFO:
+		ret = kvm_riscv_vcpu_pmu_event_info(vcpu, cp->a0, cp->a1, cp->a2, cp->a3, retdata);
+		break;
 	default:
 		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 	}

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
