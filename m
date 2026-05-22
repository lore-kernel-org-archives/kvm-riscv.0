Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71D2CD5BB5
	for <kvm-riscv@archiver.kernel.org>; Fri, 22 May 2026 13:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cYuiPHsQrneiB4zrknJl5tVnmNmBD7ZXUT9uprqW0Qo=; b=4I4XY+hw3K/Wcp
	as02hMbMQgYYuJy2TT8/ReiY4rZ6aAQoFTLcM1/gF2f+syahIm0Z8RW9nQn8+ocLPEHyMMUjGraF+
	DVIabEL4W3W4tmlLr+OAvkGlITjEP8WK/1/5fYvL16dp7meTWAOEViyo2cPL7AE1yBxLgx4PeJd9W
	gLULiuxQMWcX0k+zdOh5mcWSuflYOHz9+VIOimv3TM8C6TMpN/g8VeXcfXFmaHrMkAyUU/CowiI0c
	NYwhxAZuKvvGOiOPhHlvqEkTw2v+WivckqleKhg/pNR1uolydd4zwo2g7aqtJ8NnCu5zJ8NXYIYoV
	AjukGi/oI2EEBkLA3veg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPaT-0000000AuAX-1rSd;
	Fri, 22 May 2026 13:06:49 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPaQ-0000000Au8N-15aa
	for kvm-riscv@lists.infradead.org;
	Fri, 22 May 2026 13:06:47 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7dbe437b072so3647532a34.2
        for <kvm-riscv@lists.infradead.org>; Fri, 22 May 2026 06:06:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779455205; cv=none;
        d=google.com; s=arc-20240605;
        b=RqsUkawpl658Fx6U1cA3qTqOFmumN4LWK47sYNLm88tpoLSAOe7BMiKc85R3XZTNcw
         4OMmTE4ZYiRk2oU1YDaJRCJZImPVtmu3X3+NrSI8NssKIquZkNQ7p4eRy6uVByzpJshW
         ZOWGQXLkrCP3V9CJmRs7FP237YfBGh73komwnUg5OOtazor0zggijoDSsSKwLCBMmKt7
         CF0G8zD8/Cei8l/i+bObMuZg861FB/V+y3jQb8tZmbFwA3mDQGzGZvBfouEGIsYNkCka
         5Dwo+tn+X7LVlihMzuJz1Uk6GrT8kz0b31VpTqoqLn3gtSiSeWkA6uNmXVAsCgNFX35e
         z0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NYAe2rB0gIMb7eEgjvs7GruqXDrCjVi8nCKCe2KONFY=;
        fh=FEliu+QVjr0n4+7FfxTwJJsXC1p1J0+WgRHdczjXeFs=;
        b=FGGIKQPsW9nsZi6tXLQYJeOANgxxFc/s38b/oYpCS+t5/qO6jXTvcWu49ThQyc6P/d
         aY+2tq6jY9+JVs6uHuHELTHvVsp1NFdWQaHyztdcy0HrHRYcc8YW/CxwFScJWF3sjO/l
         wseb9JQJYqwNopfsNtZVJpsWTTNRi8TdJVMd7ziFcKyIKl3illlh7CgtRUn3i2y08ENv
         Sz+1hQhWkp/KMu8zeY/XgBQgKigtO1Xn4h1WA1hAKmA8hb3jh/XNmeO1U3IXqBMifx+P
         gHzgvnW4t1kDzdKwbMJorknfDe5QPvqfUB+gNPng5TX5TaEnEAZt7K5gMgIrKDSYpZYO
         n5fg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779455205; x=1780060005; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NYAe2rB0gIMb7eEgjvs7GruqXDrCjVi8nCKCe2KONFY=;
        b=oZaxIPyKsqEs5P0LeP8wJZlj/inMNmrg2CC7x67s+dX+1GjJ3Ti3DtGym9hyJlPv6t
         r3TO7SPSMHvbWHoS3Trc3TlIAFTgaoL1F51fOVaLVucdW7a4goBjoh+Luu5WYnbt1nki
         t02E45L8mDYmnZKxuL6/tKGuroni1UV0g93O7Os5osxUxYfGh2CuO+RokyAB1FGkCZod
         r3xu8HkrG4A7PRjoCJ+2qMM3grwywadL74HKkcv2eBxH82JCpd+muT7fz09eRg4MFZu/
         xOhOAzzt+MS2puCu+VDWqG+QX3/lUCY0iFLkcI2r3mKrSHF2LrR8FJryF+YyrrbCaIFs
         0v5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455205; x=1780060005;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYAe2rB0gIMb7eEgjvs7GruqXDrCjVi8nCKCe2KONFY=;
        b=X9mm/rxoabsYPlOMemYlXK4Psd4LmdcbYW9zVEVWMQkWEsVvQ8wWQEnuDS2F0qGry0
         5GkOvAq/gANjj5oXgsCleqoydm0dJ3T5dla6goPR7iZ+V5wrHItx7EbFanREGV0apr5i
         rpYQu/9FjIENb2pExGjZ+L2ljgsrrBs4DH7VGmD1SnjlbRVzqxxVIqHX642QBGrudKh6
         QjHIbnG6ii4xDG7twKmMw317ECIS3u8JO8D1f3+LUzpe3STY2RkOQt/+CWS4cjvZkFbI
         +5OYmC+gizuf9JiAIgCPpQUt0XrWUDCYmHfNrVticjgwh+/uI4CPC3Uf7sOsDPuKM5iI
         +8Uw==
X-Forwarded-Encrypted: i=1; AFNElJ/kxAXQdnSjYiR0mn76NHkwd18C55RT+GSuyPpKwFifTOP7Z8IGUu49SoGmKg/+8NbiiedwCalJ/Sw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4QcDNuDWwGsbaDJlHArI8AVKBA2JsxPrkmxubC8CBbXRXd0YE
	ttgdLBxIbWoUpeDI9tC4IkIsktSWlsPUHaAPgoxxZpREgeqztboMQtprumDYOF4XC4yuj2MjEgV
	mHCQJ8vSn8ijPMkzo4moz1lbHBRztKXuPfCHi3rGSIg==
X-Gm-Gg: Acq92OEcNlyOGtSfCI4hRYq0fNVrVpXFtNQBLLJ/kvnlxVmtXAO9z1lEJLbGIjLthpk
	5H0VJYVsldZNA279DIZJVTzrYx6Ln7wWxYLpeGGmzoVLTwBxtDgT+xaua+wTBIRVmDQNGwf4sCq
	yTHmhqmAB4S0LC2UPNTf1ejtN5pfVMG1SkrBizGo2sLiNrenQ/d7ub3+MF8IPAZN1PesTuDmufG
	T0KZhYyIA3j4NKgmNxH4gw5yNWpDNsBTfFLyQ7fBW+G2fIxrfj0pVzW9yaQJAhL48iY02YMDdFK
	Zh/0AHudGmwoalpmoCwZgUAv0aTxMMJBGB/hCLe7P3gpXRT6Gw0oPUmfc+0eadufbLJdzmCXjps
	x5wJV4cFMJrqV5dcFfJ9TeWCmLWyJZnhIiHs=
X-Received: by 2002:a05:6830:4983:b0:7de:60fa:6203 with SMTP id
 46e09a7af769-7e5fef070c8mr2267305a34.26.1779455205099; Fri, 22 May 2026
 06:06:45 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 May 2026 18:36:33 +0530
X-Gm-Features: AVHnY4KfXNm77pz9jWxpxXvMATQwUmW7tiCNVyzvocwyuvXKSLYVk8Oece-by1c
Message-ID: <CAAhSdy0-joewqwsJNkMgzKvc0zh2cTFgTqdP+LZAAxmfEd+Mpw@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 7.1 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_060646_590010_26E9CA57 
X-CRM114-Status: UNSURE (   6.92  )
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

Hi Paolo,

We have the following fixes for the 7.1 kernel:
1) Fix invalid HVA warning in steal-time recording
2) Return SBI_ERR_FAILURE to guest upon OOM in
    pmu_event_info() and pmu_snapshot_set_shmem()
3) Fix NULL pointer dereference in SBI v0.1 SEND_IPI handler
4) Fix sign extension of value for MMIO loads

Please pull.

Regards,
Anup

The following changes since commit 5200f5f493f79f14bbdc349e402a40dfb32f23c8:

  Linux 7.1-rc4 (2026-05-17 13:59:58 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-7.1-1

for you to fetch changes up to c7832534a8160276cccb9a8cc8cafb5614c579d0:

  RISC-V: KVM: Fix sign extension for MMIO loads (2026-05-18 10:19:18 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 7.1, take #1

- Fix invalid HVA warning in steal-time recording
- Return SBI_ERR_FAILURE to guest upon OOM in pmu_event_info()
  and pmu_snapshot_set_shmem()
- Fix NULL pointer dereference in SBI v0.1 SEND_IPI handler
- Fix sign extension of value for MMIO loads

----------------------------------------------------------------
Jiakai Xu (3):
      RISC-V: KVM: Fix invalid HVA warning in steal-time recording
      RISC-V: KVM: Fix NULL pointer dereference in SBI v0.1 SEND_IPI handler
      RISC-V: KVM: Fix sign extension for MMIO loads

Osama Abdelkader (2):
      riscv: kvm: return SBI_ERR_FAILURE for pmu_snapshot_set_shmem() when OOM
      riscv: kvm: return SBI_ERR_FAILURE for pmu_event_info() when OOM

 arch/riscv/kvm/vcpu_insn.c    |  9 ++++-----
 arch/riscv/kvm/vcpu_pmu.c     | 12 ++++++++----
 arch/riscv/kvm/vcpu_sbi_sta.c |  2 +-
 arch/riscv/kvm/vcpu_sbi_v01.c |  2 ++
 4 files changed, 15 insertions(+), 10 deletions(-)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
