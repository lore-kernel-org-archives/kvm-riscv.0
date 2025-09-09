Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EDCCA0FED
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 07:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KYR34NhENsZEdmL95ohsPQBYlaZpZj8u+pwiwSpr8lc=; b=oNtsBY70m6CX2c
	NX8nvQuvntS0sVYvzDebnapLW6Ij5cDEyW2dYbr0U70DgCQfyCsgF9PwZWF5a6tKZwvBIibenl0J6
	EW3CCwXnUHHx5RjSDrOa4XPkB3hH54rukKAsGJzCcajfzJ0K4K9xtWNrYrpRmZF0o0iyILYmOXjzA
	DduQPbhYfwmVTQ5mrWd+9EzM9H0YSBb5IQhOwlGlRCjvQvSTbJq5wMud0+/T7OMYBYEdSdIeo3BtF
	8slkrOCTImYnqNppku4bi40ivXR70mskIPqeK7bIgxSRnLrVAyr77hZZ7x7g7ujmdFHAmW36aYKti
	NbwoTYoQYC1J3DrCWCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtD9-00000005NI8-1TGU;
	Tue, 09 Sep 2025 07:56:19 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO3-000000051mM-44ap
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:33 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32b02d88d80so4755744a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 09 Sep 2025 00:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401411; x=1758006211; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1acfgimCOFblXvFIi2ykb4JvdpnCtTT9WTI2WJXrlYg=;
        b=Esa/tQ2swEB1o2VUoDaMVhWbeqs+9zZo/H2i1+dqAoppvR++nOqacQ/R/EIXCDavJa
         IaXnaXHM/W8DEVeDEcyBxFJCavgl+93fnsdggQ2nfErQj/7FssBP18oK1FxM22NKCIl6
         v0NlIJxuK3AOTxJBsf77RnuCkHXzof40Pm58Dbvw5YMVcTNV09UZXS7wl+TazvFZ28LF
         sspnGshDB3T9oeG/Na7jkwqmq647OA8uVb7hD4TOGNJCblLbPcM2X1yUegNB2RDugQNu
         Y16qr8iQanw0DysfH9w7A+QRUw2oVUif2XIxFHxQWGZi40cNcDJQB4Uy9/MNBN5w4SyA
         BsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401411; x=1758006211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1acfgimCOFblXvFIi2ykb4JvdpnCtTT9WTI2WJXrlYg=;
        b=MxmIiDGvUFgBsr9qGc5ieE3dcaD0tD9d+zXQftdH7xyw5ptGCkYgOeu/px5P01cMzV
         6/aT6aRzmgy0WoP9/aV+LdLHr+qvQKJh4mcprnL4uLand4FBb+FuDG68rrPmgIwjPwyl
         SguuJZZAyJhdu83F7Zq3IFbvudwMiYn5928+PH3s9TdufrUaipALw7mCobjQkNpEVKCt
         KF4MIEW3RSfhOMn9WJAwm0tZWv34pfcMdmHPqANuf5KXUHoVuCZys95lMfsK0mrdcSS0
         Uihdmx2Nqy8Kb3pBo9DjarMHOlvk1uHgmBPECSgVsCuPwgDhHBeVWfRP06w2VFUnk9iy
         zbtw==
X-Forwarded-Encrypted: i=1; AJvYcCUkF4Ipscd1BufmkwYRpr9G+Bz7QSrk5ghD7qnbk6zuwFcq8CE9+OQ6urqbujujiOIJjjzxPl39v/8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPJ5aw8mt8mtN8/t+zoBVOEXbzzWiyjWZ4tSMeZoinbiYbgGjl
	6YUIaOE5N4oaKrzpyerDXHg0YToaZEqLGQ4Sj9vzcqU910LLTgPgMn18H8JcoSEbx90=
X-Gm-Gg: ASbGncttuKIyuqtUs0ebREhdZ5BvDc5OPfQEwQJMCyJWzlo/nUfa7ouc32MULFRrhQV
	UueDVunk9LLyWKKRKF1IsjFbZWX3GoWrCkBFdDqoVxagep8MspCSeRGMja0l0eOdI4FMvI9+4Fy
	400k65sIxOcWrFbMVXZ8+WpBTmCl4FXkW3MHan5VzOeiqcoMr16zcHshXS/8LAeadCeJkt7oH/M
	DU8oidpPDzGcLZfCShGgIHLwkN7kglsmihoZj9amuBDU/lWEuJV36kyQZpFYhoTrd0iItB/jYcv
	JZnlb/qbeym6wrpjYnUtyYrKSPGOmA7AAZ2gHQrcCLJH+mWVXzmjHN+hH0ywmanaySttA+7hqJB
	CzXebB/TwwHUrjVkdj39j1Sl8Uggq/Fbtb3g=
X-Google-Smtp-Source: AGHT+IHkDiF/6YwaQUzgE/xNLZqLa3zDoLihcHBPhzjoYmHrHw+d+76R53kpaEg8N/1vJrkgHwEwEw==
X-Received: by 2002:a17:90b:35c6:b0:32c:2c5:e21 with SMTP id 98e67ed59e1d1-32d43f85d9emr12290210a91.32.1757401411327;
        Tue, 09 Sep 2025 00:03:31 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:30 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:26 -0700
Subject: [PATCH v6 7/8] RISC-V: KVM: Implement get event info function
MIME-Version: 1.0
Message-Id: <20250909-pmu_event_info-v6-7-d8f80cacb884@rivosinc.com>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000332_014448_39C6C69C 
X-CRM114-Status: GOOD (  15.16  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
 arch/riscv/kvm/vcpu_pmu.c             | 59 +++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_pmu.c         |  3 ++
 3 files changed, 65 insertions(+)

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
index f8514086bd6b..a2fae70ee174 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -449,6 +449,65 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	return 0;
 }
 
+int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
+				  unsigned long saddr_high, unsigned long num_events,
+				  unsigned long flags, struct kvm_vcpu_sbi_return *retdata)
+{
+	struct riscv_pmu_event_info *einfo = NULL;
+	int shmem_size = num_events * sizeof(*einfo);
+	gpa_t shmem;
+	u32 eidx, etype;
+	u64 econfig;
+	int ret;
+
+	if (flags != 0 || (saddr_low & (SZ_16 - 1) || num_events == 0)) {
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
+		einfo[i].output = (ret > 0) ? 1 : 0;
+	}
+
+	ret = kvm_vcpu_write_guest(vcpu, shmem, einfo, shmem_size);
+	if (ret) {
+		ret = SBI_ERR_INVALID_ADDRESS;
+		goto free_mem;
+	}
+
+	ret = 0;
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
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
