Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57845CF45B7
	for <kvm-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 17:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CBmnJqpg170huh5QEqX1nRNfen33Dpa8anXgSAsofa8=; b=cjlFN4JNfA6s30yPlfnvU5S1Tq
	WFSl2DFQxIRLSs4xeNwaa1dt+wmdSt3608S7uPnuN7uRxrsAD4JxG0oNqll4aQYu8f60tUn1cu6/s
	/wNpAOc6lfhJJEkJXYlZCN74RTN7CiUlSAmv3HLbuSiUsUQdSYCmd7F8nVdKju+zY95bIn7QYJDO1
	uxkHcgpKlKHzrSGkp5EOyL7fxUwsvcGOZcPdWbbZUORiszMgn3sPag6kq16dDSEjyuhjlV490/Kaj
	GmDHzV3gMXoM86hJVe7NOC3lCa40vba0K7CEC+E7YjAY2CBd2BpHMGmyKHl+H/roTuJYxqBHbnys6
	lrMrVvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLun-00000005s6J-0Ntk;
	Mon, 12 Jan 2026 17:41:17 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLuk-00000005s4N-24J1
	for kvm-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 17:41:15 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso4981243a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 12 Jan 2026 09:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768239673; x=1768844473; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GjcQk0a1UAYd4d2F3ain9c0ugcRpjACAg8kxbdTJqns=;
        b=J+729f5vRRuC/i+RHvoiRu4y+y6GuGkOZ/cv8eKI++t2CLUJxcpVGRg8AMAB/uXXEH
         /GbGvWm8Fs21QTjtv5Q6abXgl90s4vdffCj62Fb2N2vi691qIUSCXmStyC7T8AIxLDKu
         RcY/D7tsPx40OVYksFIwkbFeV30giYEJKCfzaiZn9wzZ0sNJ+QYD7PQlR6FKgERpaTgl
         MB6zhBXUBSi8FPilUKr4xjgy2OnfEZgmOoPKnMRm5FBd2GwNzmHq+FXr7oJfqFzesx3N
         E0dMx92LBHBXf5TDfFcEpRolMW6MElsqWpzFSMttLem9Wt8e460YQBv8K4PolvKlD3Bp
         XbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239673; x=1768844473;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjcQk0a1UAYd4d2F3ain9c0ugcRpjACAg8kxbdTJqns=;
        b=o3z8ueiTrFh9aO/MUv9g/Kcn56mK+3VbX0bYu4uB9GpDAnGBP/zo5193lTnIv//a3t
         6wUZLsgez4HzAuHTyPvtQH49oPZgjwE5B1gZXSh1CeE/HCELj1Ki93IWxtna1l0K5PbG
         VVbfZeTeAZzw4dTjyqRTiGpcJjqRFr8FfWxQbhAUZ/z7sNenWNLsdqe3aDwRE3MO3yBi
         JWvPufnafQR8ztDH6kwP8ptejuwt8G1lYsukVEtMVXiqwFXQCrwIeJSbv5LNLBx0cxi2
         lNuXu0nzm1UjOx7V0Iz38RwyiGH5OpqeDyJHRl0jCpeD3H5NvMmuB+HefwybnA/smgXN
         oQTw==
X-Forwarded-Encrypted: i=1; AJvYcCXqPSoHwrKBm4lS7Qp4sDIAqhONRF8dISHXqRpKOcxfR6n8uZrLQa0+FpBeTUs7L/7vG8hDH4NOBik=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+HLz+bDy8I/k92hybZgY5ilwmNZjfy6TZG0LzuTi29V0CDiug
	4ez+nJv7TvrUcq5uvl/HIf215lzEwtkV+2UtGyWYwEQsrHP2BYQM5PqkVEoq2zinsIj5fOQYqQb
	d8hGrWg==
X-Received: from pjtz17.prod.google.com ([2002:a17:90a:cb11:b0:34e:6306:8cc1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5105:b0:340:c094:fbff
 with SMTP id 98e67ed59e1d1-350fd17061fmr123119a91.10.1768239672675; Mon, 12
 Jan 2026 09:41:12 -0800 (PST)
Date: Mon, 12 Jan 2026 09:38:50 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <176823927928.1374831.6143260021717522522.b4-ty@google.com>
Subject: Re: [PATCH v4 00/21] KVM: selftests: Add Nested NPT support
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_094114_529062_86C3D649 
X-CRM114-Status: GOOD (  12.02  )
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

On Tue, 30 Dec 2025 15:01:29 -0800, Sean Christopherson wrote:
> Yosry's series to add support for nested NPT, and extends vmx_dirty_log_test
> and kvm_dirty_log_test (with -n, using memstress) to cover nested SVM.
> 
> Note, I'm mildly concerned the last patch to extend nested_dirty_log_test to
> validate KVM's handling of READ faults could be flaky, e.g. maybe if someone
> is running the test under heavy memory pressure and the to-be-access page is
> swapped between the write-from-host and read-from-guest?  But unless someone
> knows/shows it'll be flaky, I'm inclined to apply it and hope for the best.
> 
> [...]

Applied everything except the last patch to kvm-x86 selftests.  I'll post a new
version separately since we've had a lot of back-and-forth on that one.

Oh, and I fixed up the ncr3_gpa goof in "Add support for nested NPTs".

[01/21] KVM: selftests: Make __vm_get_page_table_entry() static
        https://github.com/kvm-x86/linux/commit/69e81ed5e6a5
[02/21] KVM: selftests: Stop passing a memslot to nested_map_memslot()
        https://github.com/kvm-x86/linux/commit/97dfbdfea405
[03/21] KVM: selftests: Rename nested TDP mapping functions
        https://github.com/kvm-x86/linux/commit/60de423781ad
[04/21] KVM: selftests: Kill eptPageTablePointer
        https://github.com/kvm-x86/linux/commit/b320c03d6857
[05/21] KVM: selftests: Stop setting A/D bits when creating EPT PTEs
        https://github.com/kvm-x86/linux/commit/3cd5002807be
[06/21] KVM: selftests: Add "struct kvm_mmu" to track a given MMU instance
        https://github.com/kvm-x86/linux/commit/9f073ac25b4c
[07/21] KVM: selftests: Plumb "struct kvm_mmu" into x86's MMU APIs
        https://github.com/kvm-x86/linux/commit/11825209f549
[08/21] KVM: selftests: Add a "struct kvm_mmu_arch arch" member to kvm_mmu
        https://github.com/kvm-x86/linux/commit/3d0e7595e810
[09/21] KVM: selftests: Move PTE bitmasks to kvm_mmu
        https://github.com/kvm-x86/linux/commit/6dd70757213f
[10/21] KVM: selftests: Use a TDP MMU to share EPT page tables between vCPUs
        https://github.com/kvm-x86/linux/commit/f00f519cebcd
[11/21] KVM: selftests: Stop passing VMX metadata to TDP mapping functions
        https://github.com/kvm-x86/linux/commit/e40e72fec0de
[12/21] KVM: selftests: Add a stage-2 MMU instance to kvm_vm
        https://github.com/kvm-x86/linux/commit/8296b16c0a2b
[13/21] KVM: selftests: Reuse virt mapping functions for nested EPTs
        https://github.com/kvm-x86/linux/commit/508d1cc3ca0a
[14/21] KVM: selftests: Move TDP mapping functions outside of vmx.c
        https://github.com/kvm-x86/linux/commit/07676c04bd75
[15/21] KVM: selftests: Allow kvm_cpu_has_ept() to be called on AMD CPUs
        https://github.com/kvm-x86/linux/commit/9cb1944f6bf0
[16/21] KVM: selftests: Add support for nested NPTs
        https://github.com/kvm-x86/linux/commit/753c0d5a507b
[17/21] KVM: selftests: Set the user bit on nested NPT PTEs
        https://github.com/kvm-x86/linux/commit/251e4849a79b
[18/21] KVM: selftests: Extend vmx_dirty_log_test to cover SVM
        https://github.com/kvm-x86/linux/commit/6794d916f87e
[19/21] KVM: selftests: Extend memstress to run on nested SVM
        https://github.com/kvm-x86/linux/commit/59eef1a47b8c
[20/21] KVM: selftests: Rename vm_get_page_table_entry() to vm_get_pte()
        https://github.com/kvm-x86/linux/commit/e353850499c7
[21/21] KVM: selftests: Test READ=>WRITE dirty logging behavior for shadow MMU
 	*** NOT APPLIED ***

--
https://github.com/kvm-x86/linux/tree/next

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
