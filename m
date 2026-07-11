Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49958C43458
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 01:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6aM1d25Z7v6NFUrYrshHwj1RkRWf+JN+LLzU6HzVJPI=; b=y3hzYYaUDbQDW+
	TV2Gg2toU3ekNlVdB7g7NaqUqD9Su3A7kG8ci1tQqUh1tWv2uO8Vsw7Svh3rSiBjbEQ1RJUk2Eko0
	/PRwvaVYKgyJmHUfDAyYoGuamxExZvBujRxXB/swYqTBlwfPpGMNNW3o6t/Gm+olnZu6nL3BO1/Ht
	f8vJsQBN1EnPGfs3jUWqdYH55FCWme4YwJC0j8v/7U+Gdzii/bxlyv0EJW5WnF2qW0eycEpOnQrEm
	7yrJIp785CdsdamYcDQye1pxbhTS7W3EIBLj2UR1CQrOsg3WWpKUfN1m3f3JQV1dCHOEqTLLh+sXv
	sgzuLNys3Vy9p+wmijxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiN03-000000067FH-30nL;
	Sat, 11 Jul 2026 01:59:27 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiN00-000000067E9-4A9p
	for kvm-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 01:59:26 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-81e8fa1b8d6so4813537b3.1
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jul 2026 18:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783735163; x=1784339963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCH55p5xEaUDpZqZ0WCRcca3k93TXbwbnWSfoY5jAl4=;
        b=UxqMYGOrM3jqo5fmf8o2yMky52IZ8FwRIaw1uSV0tFrVbN6YOBft3AhcBCKVTwz29k
         4G6m1+Ek+nS3TTTErYpz7DaewMAVDBSI7G3I5k3d6AfAd3c3ofQICBV11lNoP8TUxmvV
         aa6OFkVLjfP/gxKUHpsBmonqoE2boxg1CTTcXgZbdO036G9xHpMtXNMkwHAVkQNZFA96
         rCHUblbKcRxW5MUcbUBorauvzwWJrb5AHXTF6XqdGcbn8AHmfuLFf9YEmU4cyjMVMjfn
         ACgSW6TBadMH26GYftQR6HWjfIDhGDump4goYKWvZt9FGZWCFXqwbKPa5IHQpdK7YIqF
         JDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783735163; x=1784339963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCH55p5xEaUDpZqZ0WCRcca3k93TXbwbnWSfoY5jAl4=;
        b=Yfoi/zYR0FepyHKJNvlLlDVDJZ0OufkYBweU6Lsw7foU8jhqKWWw6mqzfmSXMRDHIX
         UuwikPlzNm4oiApepX6XfSJStH/TNLERUxyS++A38X3bIUK0sIHife/wdRsqxl+YwJfB
         2uUZotoa0VQVqU+ICbHOBQI8FjfT0BsgHFsb5vYaF4flpoJm1XMbLJhGcyEab6RWvOtU
         piT7Wxq6lWgrRNcEASB6mIoGTuSAAYcGMki+2CXg+XUj0QupwQREBOrbvFGIT+ge9eD/
         yIWNINxx9D14AGl+msNrVhbowuXL2I8J41FL/Vu4IdNfZmmP/6XLVLkIGfd7NmGtoIQn
         bC6A==
X-Gm-Message-State: AOJu0YxZwg0HENcnkB0Tmvd9C9cYB+DfXu1wgaBTTbjHEeGEKgCQuYLW
	2/z0k1Bx9jHxDa/XsEE/r89snys6Qx9nE74JqcAYhkRlvYbNBVhTwdV0ILvUc3Kk22U=
X-Gm-Gg: AfdE7cnzkhBsZNGI0WONONQf5BCLKfeiTmwynhyysRZeoeJiE8rcVZOGKiplObUYS8T
	wF+vlZ+8zj5ESHzFUwJkUugh1hm9OkJm66pNAUY3V5uzYgS2mF8BCN/wr8KYNqYZ/k1VSmnGq/h
	c9gDTF8IJDVAkWT6xdYYNdGA0oyJFUTE9NhV6nDXZdYPPsAR1twBzegDT2mDYpuBvZNE3S3A1GN
	dL8KzQw4HC/2cfwwns7NEtT5LTQgg2lFye6sqhctPoxRJe1eI7HDcGdxmP1etO1CHPF+KR7XmFh
	5zNWUcFdDCtfArvU/IyoUj7LD81dzUlYHJ13lOFt1b4I/d95TmFcJp8nweaSm08/0VfOUeiGKdH
	MITctsU1ydF363HlAoiqhU7n8Ou+GgfY35qQfpC6ax8LYy2hKgpygq/ermtlDored342cyUfC4M
	xe5wlre6MFVmaXqAoIbcwGutCk7npMT3nc+04pffqdzTSQUGJvhUXqIFwhd44+AYf7O3oiywODH
	nhH+Y6PKJRdc9kdBrYv0YTBwk6VFoEKqqY4L0I3
X-Received: by 2002:a05:690c:7:b0:80b:1616:5c0c with SMTP id 00721157ae682-81e9012e049mr10725847b3.41.1783735163246;
        Fri, 10 Jul 2026 18:59:23 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6befb688sm61316497b3.14.2026.07.10.18.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:59:22 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kvm-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v1 0/2] RISC-V: KVM: fix vcpu vector context handling
Date: Fri, 10 Jul 2026 20:58:28 -0500
Message-ID: <20260711015835.767259-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_185925_042595_8C1C8AEA 
X-CRM114-Status: UNSURE (   9.37  )
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

This series fixes a vtype corruption encountered when running perf +
vector workload on KVM.

The root cause of the bug is that the kernel-mode vector (KMV)
misattributes the guest's vcpu context as the user's context. To solve
this, we need to correctly save the vcpu context when the kernel-mode
vector is serving a guest.

However, calling directly into KVM from RISC-V generic architecture code
creates a reverse dependency, which is problematic when KVM is built as
a module. To address this, we introduce an RCU-protected callback for
context flushing, which KVM registers during module init.

This series will create merge conflict with my v4 [1] series on syscall
optimization. I will send out a v5 that has the conflict resolved once
this series is sufficiently reviewed.

Patch 1 is a preparatory cleanup that refactors
riscv_v_start_kernel_context().
Patch 2 implements the callback mechanism and fixes the context handling.

[1]: https://lore.kernel.org/all/20260528190927.886558-1-tchiu@tenstorrent.com/

Andy Chiu (2):
  riscv: vector: refactor riscv_v_start_kernel_context
  RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector

 arch/riscv/include/asm/kvm_vcpu_vector.h | 24 ++++++++++
 arch/riscv/include/asm/processor.h       |  1 +
 arch/riscv/kernel/kernel_mode_vector.c   | 58 +++++++++++++++++-------
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    |  6 +++
 arch/riscv/kvm/vcpu_vector.c             | 18 ++++++++
 6 files changed, 94 insertions(+), 17 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
