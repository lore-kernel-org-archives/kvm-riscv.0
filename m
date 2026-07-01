Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D8DC43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 04:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2thyvbUYlPbt+diqNyHR7vL2FFRnGROKHaGuWxFDFp4=; b=1gtYD09lOauSYh
	7cIwJ51KKMG1l+9jWwH7IdR9rRaNo3zYpQoQEF+Pmna8xJ8pIzZUKs0o67mSfLRhcWRQRah8LkLMV
	73Ky2t3AFaLUKYYzvHTz7sluP1q9VYttWb05KqQY3lgZgsdMfFmj70VmO27LudeeHO5S68B4Xa+it
	+HKCZ5riPrBrUUPqrvTEJS5jRbEvHeMaccduBNiS+ufNxr5G+FBMwVJkCdU4snB75Gr+t4O0xUFHb
	Dgl3CVS58wXCash0A7VuCYytIikoA8iFN7E8vLCorVljBBoXthOuoE2wp194omR4CowmvDW6r9p2N
	3dFK78GNRUaCkhf4ktVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wem7n-00000000bjI-1l0f;
	Wed, 01 Jul 2026 04:00:35 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wem7k-00000000biX-0xZ5
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 04:00:33 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3078e0dcd67so291999eec.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Jun 2026 21:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782878428; x=1783483228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAjXq9Ej4fB7f7nIuAnBVBBySejxitzWJLxvllDtjcA=;
        b=P/kO16BSmqP0sQfGEpm7bxUH3HV6gJbeVDaBp8fG+ZFi0/2rY9vvo9o7hayzEXoztP
         2orWLennQZTx+/bindz7gvd3EDbOOq6NRf1wve7zxmRL1K4SY/vaUY087xGsSGYvkfrc
         ZKndHQDyyE4Fdk5OcKrCd0rJ43WzEitgkzDL45ViqQVWjy41DqLBa6J087Sa0w972lx2
         hbJd5vQbg0aoVP4QwSIDGO3LRhks5wKwxHmxbALLiwvfAu2lF2dso4V9+U9yYWmWGIjg
         eFVXLG9yRix7On3oh2M7xWI5+ocHrsA6/ZwXgP9fA93uP97cceDj38wBhERaiCeMFpmq
         SfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782878428; x=1783483228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bAjXq9Ej4fB7f7nIuAnBVBBySejxitzWJLxvllDtjcA=;
        b=hINcjCtFcXkAxwzlL59XcLVaTurz59gHn2Cipmm6B4KQk8xL4rCQn3TEN+OSoYKvF5
         8ULTcfcUgUHkcbwc1pNZ+Q5rNxSuFcIxcKGqKndZR9w+aH4qIyCUoRwEoSRPmTsZPocL
         9hIwgzoE+JtX5wtbC8y2Yjtav//g8uhaethpH5EKRQ5d9X3XiVyghdf6T+nP6Oe/o1yd
         z395EA/braNiFq4vQcK5/NM72EIVvGt7uP+sBpePA8Q+jDQZC5vdQnmljkYVhHl+kmDy
         4KyhwUggUq3Gh1gPnyQtMw+N2OGMS0BEIeZweZbutnJaF4W2tXHx45SbrDCqREczUyEP
         7saQ==
X-Forwarded-Encrypted: i=1; AHgh+RpoQcNuDlU1TykIDsNTGHbv8bz9glVRmnOrCs/6KvfTrjmiyJrgWJWb9fn87kKt0HB7g9O9UhPpLA8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzBqCYyNTjWN+oLNLYBWuVVBq+bY3tbVdg2wiTa7yiNYU/pRqQ
	bUVVbDvz9Ytsu2uBK3I2CSwiU2pLPNpjjcDKEUwy9VvTDnt8Hj6A6Gx+qFEWOzfnq8w=
X-Gm-Gg: AfdE7cmXXnvsNAP9oxJ+Gyg2eSCFt9wI/gcUivKsxsCp0SN2je3pRXvCh6HMq2V6ZTc
	TRF3gOg2KjFL7bONZWplTs9cig3roSuRXKfI9EtGsjAZwShSrtirMBQAElzAqvJn6w679kTUvwD
	UgthAYxnBK1v06FVz/7B+4p5YOAVExO2tmBLcWV1x/Bg9fPznEZ4HoOcA3f0CUM5rZgJRtFap1n
	tfUgpdvbvpXbVocGaslSGK5OLyv1gZy1MyTAiUJQfm9XtGchwuQ2gOcG5YrSS1KnxA4uVS5BGJS
	EOKw415ciQxU1TfE35koO5OuIPuQpdAkz/wxURT76YBm7TLIFC7/240rfcxG+C587RIKcgMfs4C
	LUVMmG53c4i036rEZTg+5F1qRuZUnB1tAM2tnA0KsK8hKV7l3bZMDNTbEhLXUUaJJ5zND/97nJw
	ySNAN8fwe6JdWl3zYu0uvWBW8bHiepyCHd17e4CM9zHzM8gPMbkdbTQD2hnufoIQH4
X-Received: by 2002:a05:7300:d516:b0:30e:c801:eace with SMTP id 5a478bee46e88-30eff05c70emr10195eec.5.1782878427991;
        Tue, 30 Jun 2026 21:00:27 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee32519aesm14024287eec.27.2026.06.30.21.00.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 30 Jun 2026 21:00:27 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] RISC-V: KVM/IOMMU: Fix MRIF irqfd notice handling
Date: Wed,  1 Jul 2026 12:00:13 +0800
Message-ID: <20260701040017.42707-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
References: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_210032_266210_AEF7BFB8 
X-CRM114-Status: GOOD (  16.88  )
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

Hi Fangyu,

I put together a local test branch based on Andrew's RISC-V IOMMU
irqbypass series [1] and your MRIF RFC series [2], then ran VFIO device
assignment tests on hardware on top of that combined tree.

One test case that exposed a problem was a VFIO guest started with QEMU's
AIA emulation mode, e.g. `riscv-aia=emul`.  The guest could hang because
a normal MSI injection was classified as a MRIF notice, so KVM skipped
the software IMSIC EIP update and the interrupt was never made pending.

The issue is that the current code identifies a MRIF notice by comparing
the injected guest interrupt ID with cached host MSI data:

    msg->data == iid

That is a payload value comparison, not a source/provenance check.  A
normal MSI injection can carry the same interrupt ID value as a cached
host MSI message.  If the vCPU is currently using the software IMSIC file
and this collision happens, KVM can misclassify the normal MSI as a MRIF
notice, skip the software IMSIC EIP update, and leave the guest waiting
for an interrupt that was never made pending.

This series identifies MRIF notices by irqfd route provenance instead.
irqfd_wakeup() already injects from a seqcount-protected copy of
irqfd->irq_entry, so patch 2 keeps the architecture's MRIF notice metadata
in that route snapshot.  Userspace MSI injection and normal guest MSI
injection do not carry irqfd MRIF provenance and therefore follow the
normal software IMSIC path.

The generic KVM change is needed because the decision must be made from
the same copied route that irqfd_wakeup() injects from; keeping the
provenance in RISC-V side state would not be tied to that route snapshot.

Feel free to fold any of these patches into previous commits if you think
that is a better shape for the next version. I also have a few other local
adaptation and improvement patches on top, but kept them out of this series
to focus on the MRIF notice issue. Please let me know if you already have a
plan for the next revision, I am happy to support your next version in
whichever form is useful.

Zhanpeng Zhang (3):
  iommu/riscv: Complete MRIF MSI PTE setup
  KVM: Move irqfd arch data into route snapshots
  RISC-V: KVM: Identify MRIF notices from irqfd snapshots

These patches are based on a combined tree, not a plain upstream tree.
The combined tree is made up of the following pieces:
In your series, patch 4/6 is already covered by the irqbypass series [1].
I ported patches 1/6, 2/6, 3/6, the relevant MRIF MSI PTE part of 5/6,
and the notice handler part of 6/6, with a few integration changes.

Fangyu Yu's MRIF RFC series [2] (selected patches):
  [1/6] RISC-V: Add more elements to irqbypass vcpu_info
  [2/6] RISC-V: KVM: Transfer the physical address of MRIF to iommu-ir
  [3/6] RISC-V: KVM: Add a xarray to record host irq msg
  [5/6, adapted] iommu/riscv: Add MRIF mode support
  [6/6, adapted] RISC-V: KVM: Check the MRIF in notice MSI irq handler

Andrew Jones et al. [1] (irqbypass series, omitted):
  [RFC PATCH v2 00/18] iommu/riscv: Add irqbypass support

[1] https://lists.infradead.org/pipermail/kvm-riscv/2025-September/010148.html
[2] https://lwn.net/ml/all/20250811061104.10326-1-fangyu.yu@linux.alibaba.com/

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
