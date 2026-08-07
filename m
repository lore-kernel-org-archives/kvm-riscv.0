Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC461C2A09B
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 05:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ybgXS3LnuccwL8pl9I1m1zQNQJcSh+SbNWwFWXxhPLI=; b=VECyexRzrjKgXQ
	F8OEP3sqQ5Br4NNQPdwPZJcZPK7vON70/8MCpueKVxE7ejmEi76pGg1xXsJxzNrhaZnaxkdFtsIFn
	T1r2OWoQVjTmy48pxdofBLsHwJa3jogQJINdkHHnr4V1AUt3kawP+fPkF/G5tbl8bRQ10OHfImzEQ
	pGC9nExFs26DT9VReLanXLiM1u9w34O6GS4hG/wn2gYhTHzcD6dJSgGL/Mw67AfZnwb4bNftu4Eky
	blHSXii8R91YSKtja0Nl5LMbBgX92LrygjT3POguckXAVijFKkHwz+3cQadO8OdCVae3EMNCYXzgv
	OTC00rxMfjvXpp1J+Oag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDCL-000000077Xi-2xcd;
	Fri, 07 Aug 2026 05:32:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDCI-000000077Wu-47wE
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 05:32:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2caea3f742bso41133655ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 06 Aug 2026 22:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786080766; x=1786685566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PIbnsun6zq+1L1BT2WwwquArLAsjhJR/tgK45GqLXtI=;
        b=qDes2qgBVG8rvC6EU2jUvmDkc5wpfg2Qn8Xsun6yhR16vqYy0aEnom/zzWvy50d6bO
         lXBnrqlLMleHm8DRmYcjtieOu0GQLQxG28kSZTvEPUzGzrvlVSEUWjTd3XKVZZ2c5XQw
         /MHTGDsuG4XyoX/kUX2cy7+VyJ1xuStc5tLCZBmUHRQ/PM1uObuxlfD41IRkNBdhG2rI
         VyYIpxH5if9YGN5qxmQw3anYFqswklJkik0mOvQ3NbtVGOhKMn4TyolVwREAkcJipw/c
         aXsl+aMPpokcjcW0uRj8I60iq00p+SS1+TxO7ezKgQ3yzT0FxDHcjzi6XnQFqL9a7sTn
         qSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786080766; x=1786685566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PIbnsun6zq+1L1BT2WwwquArLAsjhJR/tgK45GqLXtI=;
        b=m7681BmcsX713U0Ybf3avG8Udp1OuqeDOWGcwXNZUDtR7KNg12GejMdqUEG1R0Vqjc
         Uc065+IEQ2UyLY3qvYGf4ElXoPoy+k6SQHSu5oK31f8DzDL2LRQruGCJaoel0ZFcaKds
         X6qezvamzR2y7JNLDVSQ2Q+mPTo+EC1JYUhERusvPS24kVBzgseO3g/wX9a7PAWi9vvn
         nFPKcNee+XBJUzJrnJXVXSjSvygXerv+Ni1c8t0qkj8DMmO3L+h7gOe0HAhZW7iSjBWr
         GYiev7QA0b9goBA77bpKC1YWgYvJ6xUKBblqltym92P6NtEcXJEq7rO/NDfofqYpP9F8
         GEnA==
X-Forwarded-Encrypted: i=1; AHgh+RoOkwtvSzgGmWOVtJBChknzc/WLFl7V5IipiZpmZorY2j3v4kD9zME6C5Au1H1GRgteMpJXMAI9uao=@lists.infradead.org
X-Gm-Message-State: AOJu0YyI9vQlTpbKLcq7vpeKuN8ei+z1ljjgrBnLGFqWOSh1R1tydB/E
	BkZBD6Dm6NPjSNRDpH3XTmLp+BcRRK2BSvkg4nPja8HdcaC2eCVYY1Pg
X-Gm-Gg: AR+sD12r7qydOt4lo66GAoxr0yDfkTJWz2dwwHDGXPG4+TAbyuxKfeGGjLKCCJi8i2l
	ZtngQKbdxTIkV7YC8LZq5SZLuX0NZS4MPM2ngluZd40Ue+yyvNjve07rhYu74o3ETh6XAggAkXt
	DIqYnUdLraobPognftSztpBPVPgKbr81j/OTdwINqbSoGx5RDikq8IEXTJsEvYUr/wo2nUEz44c
	QqJvU/BjFkce9kId7EfEve25BwRqJVqaA1tt6hGvuzZlzqapu/b7EqpTPSyw7JvW1iyeqG2NL5T
	q4jlwtpq2zsEBp0e4Y+Sctg8ILUy84EsBHm8jqnGipYE2jBBzk046PXIerjFjoZPber0iXTX5f3
	BiO8JpGmRKrHPCA4MtiW+D5UAGv8phaLIr/6dG+m+CJu98fA71Un1A/zgsnXjc3PcixPk1LKn9t
	4k+uLf7CbY493GQt+loUuq+bYwS8R8z6Qq7r/pv4n1Yr20tvCtpjbjwto7b8BaqlBU9tjWAtrat
	wDbobA=
X-Received: by 2002:a05:6a20:918a:b0:3bf:d0c8:2aa4 with SMTP id adf61e73a8af0-3cb85df0a10mr21226501637.8.1786080765955;
        Thu, 06 Aug 2026 22:32:45 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19634dsm108940a12.7.2026.08.06.22.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 22:32:45 -0700 (PDT)
From: "Yuhang.chen" <yhchen312@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	pbonzini@redhat.com,
	shuah@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhouquan@iscas.ac.cn,
	"Yuhang.chen" <yhchen312@gmail.com>
Subject: [PATCH v2 0/2] RISC-V: KVM: Add PMU event filter support
Date: Fri,  7 Aug 2026 13:32:25 +0800
Message-Id: <20260807053227.341700-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_223247_044575_BC9DDDC1 
X-CRM114-Status: GOOD (  10.39  )
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

This series adds PMU event filter support to RISC-V KVM, allowing a
userspace VMM to restrict which SBI PMU events a guest is permitted to
program.

The KVM_SET_PMU_EVENT_FILTER ioctl and KVM_CAP_PMU_EVENT_FILTER already
exist as generic KVM uAPI (include/uapi/linux/kvm.h); RISC-V KVM does
not yet implement them.  Wiring them up lets a VMM limit a guest's PMU
event access, which is useful for sandboxing and for withholding host
PMU events the host does not intend to expose.

Patch 1 implements the kernel side: the uapi struct, the ioctl handler
with an SRCU-protected filter, enforcement in
kvm_riscv_vcpu_pmu_ctr_cfg_match() (a disallowed event fails with
SBI_ERR_NOT_SUPPORTED), and advertisement of KVM_CAP_PMU_EVENT_FILTER.
Like the other arch-specific KVM uAPI structs, struct
kvm_pmu_event_filter is defined per-architecture; its layout reflects
RISC-V PMU events and the ioctl number encodes the struct size.

Patch 2 adds a selftest that covers the ALLOW/DENY semantics with the
event in and out of the list, filter clearing, and ioctl argument
rejection (EINVAL/E2BIG).

Testing: built and run under QEMU TCG with nested KVM (an L1 KVM host
running an L2 guest).  The selftest (patch 2) passes and dmesg stays
clean throughout the run.

Based on v7.2-rc2 (a635d6748234).

Changes in v2:
- Mask reserved high bits of the SBI PMU event index before comparing
  against the filter, so a guest cannot bypass a DENY filter by setting
  bits above bit 19.  Noted by sashiko-bot review.
- Reject non-zero pad in the ioctl argument to keep the field usable
  for future extensions.

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Yuhang.chen <yhchen312@gmail.com>

Yuhang.chen (2):
  RISC-V: KVM: Add PMU event filter support
  RISC-V: KVM: selftests: Add PMU event filter test

 arch/riscv/include/asm/kvm_host.h             |   3 +
 arch/riscv/include/uapi/asm/kvm.h             |  20 ++
 arch/riscv/kvm/vcpu_pmu.c                     |  31 +++
 arch/riscv/kvm/vm.c                           |  69 +++++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/riscv/pmu_event_filter_test.c         | 199 ++++++++++++++++++
 6 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/riscv/pmu_event_filter_test.c

--
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
