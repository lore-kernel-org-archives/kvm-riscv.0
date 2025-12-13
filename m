Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95085D5B159
	for <kvm-riscv@archiver.kernel.org>; Sat, 13 Dec 2025 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaTkgEOPCZYV+SPhBNPlSMlds0y43qTVGGd9oGxAQJc=; b=KfAGaX970kjJ/v
	znQVy0+8Z0h3N60IeMjiEQGWgvXb4AlDPGNrYJ42FQUMVzSJEpP9LLbzwiKbo2bLJ1L2a8xrhrOth
	yN03p0aaDaBOw7pN1A6XnVgrHoDFZniI1iD2EP7VJ9paMKUEDgZBV6/kLe2HBPCJVkP2OUNkl0V5i
	MxGoTX0RkDsjZkucd7r6t0eRW2+o3xMEHbSghA+VbbKqTb5pdVPPz1GesJqRyNNaBSZ4zKz3AaYc5
	RnNXn4WiYzxyQYg7dPgpRn519Q9/VIFqS2obQb1RmirUeXtyPepj+7y/Vkpax6qH6Ofi82ha3L8jm
	gR5CtVHINHLQQDZvZdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vURFD-00000001ieQ-0nQ2;
	Sat, 13 Dec 2025 15:09:15 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vURFA-00000001ide-3Jq6
	for kvm-riscv@lists.infradead.org;
	Sat, 13 Dec 2025 15:09:14 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2984dfae043so20448115ad.0
        for <kvm-riscv@lists.infradead.org>; Sat, 13 Dec 2025 07:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765638552; x=1766243352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gz8I5jl1qyQO0MpJuF22MiSS1lFlGXvXKCb0VFWa7N0=;
        b=JeJtquNdaP2H3aM7H7DRyXD2j5fvx/93yr26FuHR2J/xfmaHLzJxXe3r3GnFIsGDRG
         FAGStdkUO9cSSRvzOKxyuQR+EQELqunQbpFfszBkkny29qDL332pe/TqVcHrIUx4YiEj
         C4hWTgiQgFg/lestE9Dgb2Q8VGsw0e5F5On6T48lNjcFxSmwb6H5myr4Jezsozvq64Kl
         v8FCiSc8hqBzrS5PFcHVyQ/mOQpy0sKck8OU85FrQ2N/QYi7zlNjsqKgtlmIaAtRjvKp
         Hn44c05yE+rrFTTRBbOmgats/414njA9I8kuwASHRT+wc3doWo9op+3y02WXe4QwqGxH
         1TdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765638552; x=1766243352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gz8I5jl1qyQO0MpJuF22MiSS1lFlGXvXKCb0VFWa7N0=;
        b=MNPFo77GKLtIqtDhmDK5osJxOhDpKur8agSVQf+XmzmH+WxFaZuH6ilbBFaOediDmN
         hOKnIuCA5ve8sKhqKTqFH09iyKJ1L3GfX35HmFTKSSyHZ9gWMdUU9pWawUgk/HTvyC7v
         6vauEr+VracfeTGxEu/yFie+3kDS6e/YrTYtxiM/R3BrG1vpJ2WFrjBmlbDA3UkMOFHU
         K6sHIeVW+4Ey9TvuFd03R3TKcLWJe8wyIIpBOw7OzNuSfHXRZhyI2qKRpwrzegQgswSP
         SMSbRtOt4LUfopxWRVH3ujKT2vNVNFKjtMn+44tBVwwVQyk347GN9iQDBC1BbC5bxu1Q
         aUcg==
X-Forwarded-Encrypted: i=1; AJvYcCWC3pq0rzjgMO9lkFkeKBrWOXQtI7xDpYVL9ZSGrrny14PH/h41ylEpMc+CUpgGV1c6edUGHjCtsvg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsgAZn3zQ5S/w46A2mAyAqv0iJ+GN+E5lqD8DI5EaEJFb4tZfB
	gqGLD5e1x6Zbf7zlcRBqecTury2AJK8m2NW5rS61YRJtVRTkT5QqyhLq
X-Gm-Gg: AY/fxX7w4BhhIGOyzsbTUcstzHWtvbR07FhlKD45vY26sHfNwCatpNrDpQU4bZcA8Bu
	wl1iwpy0Ysb1T+dvBi7Ak3NnVBay2TJj2AizCwqCQE4600IAw2lrbbtxIEKw3/GIs9Baoy3NOwR
	idU3AjB6SuUmvrG8L0kp/ERpy7leXMbRmWZl03It4FNHfZcPukUv9jGt+LrCNG/396FnpJ2a1vh
	JuN3hSgWPo5ZiMqETOtJ5weVt5d0yDz/x8vKk6XV4lxwtUi/8HsbULPCqJcgNX+P3Ncdhyr0rVm
	+Getn/IvMK2fU+YWIc2dtRk+F0CoENIPX4VQnHDcqcgOLb9005hfXAsyhppRYykxOklSPyPXH4J
	5KgkXGrdYVll/ua7Mn/jsgAyRvMRB3LOSw7+ClPqJELCO68Kj3ZwHpRPuTKl9MsU2AToAFF2nMp
	bCbXJ4IxZPf64UkuTv
X-Google-Smtp-Source: AGHT+IHhr/NTcyCI0sQBcui69+ks4sJWgn/BIWiamUG1k98Zmrlr/Bt9eoe/k8Ql/eMzC92DGm9lfQ==
X-Received: by 2002:a17:903:2308:b0:295:5945:2930 with SMTP id d9443c01a7336-29f23dd7126mr61354455ad.2.1765638551861;
        Sat, 13 Dec 2025 07:09:11 -0800 (PST)
Received: from JRT-PC.. ([111.94.32.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016c6esm85494715ad.59.2025.12.13.07.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 07:09:11 -0800 (PST)
From: James Raphael Tiovalen <jamestiotio@gmail.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	atishp@rivosinc.com,
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: [kvm-unit-tests PATCH 2/4] lib: riscv: Add SBI PMU support
Date: Sat, 13 Dec 2025 23:08:46 +0800
Message-ID: <20251213150848.149729-3-jamestiotio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213150848.149729-1-jamestiotio@gmail.com>
References: <20251213150848.149729-1-jamestiotio@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_070912_882930_EA14197D 
X-CRM114-Status: UNSURE (   7.92  )
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

Add support for all of the SBI PMU functions, which will be used by the
SBI tests.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/riscv/asm/sbi.h | 22 ++++++++++++++
 lib/riscv/sbi.c     | 73 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index 35dbf508..8794c126 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -390,5 +390,27 @@ struct sbiret sbi_fwft_set(uint32_t feature, unsigned long value, unsigned long
 struct sbiret sbi_fwft_get_raw(unsigned long feature);
 struct sbiret sbi_fwft_get(uint32_t feature);
 
+struct sbiret sbi_pmu_num_counters(void);
+struct sbiret sbi_pmu_counter_get_info(unsigned long counter_idx);
+struct sbiret sbi_pmu_counter_config_matching(unsigned long counter_idx_base,
+					      unsigned long counter_idx_mask,
+					      unsigned long config_flags,
+					      unsigned long event_idx,
+					      unsigned long event_data);
+struct sbiret sbi_pmu_counter_start(unsigned long counter_idx_base, unsigned long counter_idx_mask,
+				    unsigned long start_flags, unsigned long initial_value);
+struct sbiret sbi_pmu_counter_stop(unsigned long counter_idx_base, unsigned long counter_idx_mask,
+				   unsigned long stop_flags);
+struct sbiret sbi_pmu_counter_fw_read(unsigned long counter_idx);
+struct sbiret sbi_pmu_counter_fw_read_hi(unsigned long counter_idx);
+struct sbiret sbi_pmu_snapshot_set_shmem_raw(unsigned long shmem_phys_lo,
+					     unsigned long shmem_phys_hi,
+					     unsigned long flags);
+struct sbiret sbi_pmu_snapshot_set_shmem(unsigned long *shmem, unsigned long flags);
+struct sbiret sbi_pmu_event_get_info_raw(unsigned long shmem_phys_lo, unsigned long shmem_phys_hi,
+					 unsigned long num_entries, unsigned long flags);
+struct sbiret sbi_pmu_event_get_info(unsigned long *shmem, unsigned long num_entries,
+				     unsigned long flags);
+
 #endif /* !__ASSEMBLER__ */
 #endif /* _ASMRISCV_SBI_H_ */
diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
index 39f6138f..ca8f3d33 100644
--- a/lib/riscv/sbi.c
+++ b/lib/riscv/sbi.c
@@ -32,6 +32,79 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 	return ret;
 }
 
+struct sbiret sbi_pmu_num_counters(void)
+{
+	return sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_NUM_COUNTERS, 0, 0, 0, 0, 0, 0);
+}
+
+struct sbiret sbi_pmu_counter_get_info(unsigned long counter_idx)
+{
+	return sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, counter_idx, 0, 0, 0, 0, 0);
+}
+
+struct sbiret sbi_pmu_counter_config_matching(unsigned long counter_idx_base,
+					      unsigned long counter_idx_mask,
+					      unsigned long config_flags,
+					      unsigned long event_idx,
+					      unsigned long event_data)
+{
+	return sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CONFIG_MATCHING, counter_idx_base,
+			 counter_idx_mask, config_flags, event_idx, event_data, 0);
+}
+
+struct sbiret sbi_pmu_counter_start(unsigned long counter_idx_base, unsigned long counter_idx_mask,
+				    unsigned long start_flags, unsigned long initial_value)
+{
+	return sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, counter_idx_base,
+			 counter_idx_mask, start_flags, initial_value, 0, 0);
+}
+
+struct sbiret sbi_pmu_counter_stop(unsigned long counter_idx_base, unsigned long counter_idx_mask,
+				   unsigned long stop_flags)
+{
+	return sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, counter_idx_base,
+			 counter_idx_mask, stop_flags, 0, 0, 0);
+}
+
+struct sbiret sbi_pmu_counter_fw_read(unsigned long counter_idx)
+{
+	return sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ, counter_idx, 0, 0, 0, 0, 0);
+}
+
+struct sbiret sbi_pmu_counter_fw_read_hi(unsigned long counter_idx)
+{
+	return sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ_HI, counter_idx, 0, 0, 0, 0, 0);
+}
+
+struct sbiret sbi_pmu_snapshot_set_shmem_raw(unsigned long shmem_phys_lo, unsigned long shmem_phys_hi,
+					     unsigned long flags)
+{
+	return sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, shmem_phys_lo,
+			 shmem_phys_hi, flags, 0, 0, 0);
+}
+
+struct sbiret sbi_pmu_snapshot_set_shmem(unsigned long *shmem, unsigned long flags)
+{
+	phys_addr_t p = virt_to_phys(shmem);
+
+	return sbi_pmu_snapshot_set_shmem_raw(lower_32_bits(p), upper_32_bits(p), flags);
+}
+
+struct sbiret sbi_pmu_event_get_info_raw(unsigned long shmem_phys_lo, unsigned long shmem_phys_hi,
+					 unsigned long num_entries, unsigned long flags)
+{
+	return sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_EVENT_GET_INFO, shmem_phys_lo,
+			 shmem_phys_hi, num_entries, flags, 0, 0);
+}
+
+struct sbiret sbi_pmu_event_get_info(unsigned long *shmem, unsigned long num_entries,
+				     unsigned long flags)
+{
+	phys_addr_t p = virt_to_phys(shmem);
+
+	return sbi_pmu_event_get_info_raw(lower_32_bits(p), upper_32_bits(p), num_entries, flags);
+}
+
 struct sbiret sbi_sse_read_attrs_raw(unsigned long event_id, unsigned long base_attr_id,
 				     unsigned long attr_count, unsigned long phys_lo,
 				     unsigned long phys_hi)
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
