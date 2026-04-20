Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95F5F5A8C8
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 21:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbSBgzU3R1QJLMzRlZ2z18kN+NRZ7QaDt8VJ8rrMXcs=; b=kvBNHaU6sgheNc
	o8S+t61Bf6w2atOn5oN1AymrymZxcf4kFtE8E6xl4suDhZCVIO2sNb1fJo32C39LvOLTHyBO1BHuF
	BPPym83rB/ItBwWxLkVK58daeTF2akzZvky97/yGbNppFMw/ytiEpExCMWFR5IU+lxBinshQdv8sX
	ODODlb0AG++u/jb73JZFNPk5hDVnpJTYL2N5JnV+OxevYxFJWFw4yVk08cYIoeWugIVJ4riNL+3hz
	7MMI6mCp+GywZpAJRvvjWHSGcEUTcDUqNzmtqsQN4nfWtcFxyWSz1Avi6oAo1M5oe4kQDAye9XIAz
	/8fvcKuuyUlWiLV8Guug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw3P-00000007gjI-2qIg;
	Mon, 20 Apr 2026 21:21:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2s-00000007g2g-3qQT
	for kvm-riscv@bombadil.infradead.org;
	Mon, 20 Apr 2026 21:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nGTpsdZingcIJU13AR/rz9Q7jpP4FQBt7uSTt0uhGT8=; b=SyW5c8k0RBYuMDSvGYz1R127T/
	n3vbZrmZP5TCCZI9USdKCxPuVgjPorn7pP5zAKbuh1AodnvVVBFomhOnfTgTBgqYiXAgkE0CmlxhA
	bfcYTjiROY8DdmbEO2E8YRVP1N6vZKugpbBsB6UqY1SAkKny9TxXCm5FPAX+2PaTLdthQEsfnsMGh
	Hrx/ciD1KdQ6PnRcU4u0cTctVKbjlkly78c40EqLEPTAdJfb8qmqN6flcqxOmEFhRa9nhRSUhPfMm
	BZU0sb88V8W0/dr3+BoB+ATafmyJr/7TAOi+E7ip4n94ev51bkEZeBHdvUcizMKcClvZbjy6tT4dI
	9xKKp0cQ==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2p-000000093Os-25D3
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:41 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b2eba42b8dso32128505ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Apr 2026 14:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720033; x=1777324833; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nGTpsdZingcIJU13AR/rz9Q7jpP4FQBt7uSTt0uhGT8=;
        b=Cqm0naYsWOZBuStLbVrhD2JxXkMisudmVaGN4G2XTGCNC5EfGWqj1fG+2hQjtAACjP
         /V6FwPuZXtY9iVDWHqStMvBfBd49hTxTdJe+2ke5ikLsIBM2Q6+aoP6+kCQMl5dtE66n
         pTInXFAROnQVdHfjkFc/fU/ImDDMuQgWdzcwUMCIPjd9/JgDfSg7nSJMD+3eSUTX8Lj4
         fcMzKrpLD2leoudZ2xXrxSgoN7CyVzYFS9jhQKbv14AAiOEurbTUSf/bpMnzF1Xu+/k3
         nzklU0NhmeSEHE0v5tY4kOc7rJQW7FL9cNEmbj9PmkejY0Rjzchd9/Jq49/rJHHCi8L6
         ybxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720033; x=1777324833;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGTpsdZingcIJU13AR/rz9Q7jpP4FQBt7uSTt0uhGT8=;
        b=T/KP9XHrN/pNLU1hmmV/3VCYgtU5fLZH6MOsy9v+AQqa7rZqkMxlnf2pZFzYwZMU2F
         34cnBQnyzj62L3Wec/Tw3NE4WaAN29k6qYhbNLeCVEjp/babMgWZ9ZdMDd6ImpCuODaG
         ol4BDNd7ilHeQZSVzvIA2nKYHgpAx1pu80wt9+GvVaLrTNjPPbmib7R055lNXOVlVLk5
         1oeszQ3dKpMjGW5/gZud+QguYN4wannHZhc3z/C1xEq3Nr9BFt8mVAHgWuXLc6CFxrg/
         aS2MPRZzVF0R5WKxVpwel6Gv+k1wIULuJQCra8wKsK6MY8g3oUzS8Ra/VaX3PRktnO3B
         wGfQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RQvqynU4M1FZf+wzmGeB5tHO2NICCqehdFinAdwZ78o6Bek+lRN31I3S7KB4OVMazfJZt0OZ3bUc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIRXveayo+2ywbZ93iJoUFLOtvwDEr4HxtZvyD2DjAoFxB1aiY
	YV3J4DMbNGL6A9LsX/ilt6IhMJYJy/7/nP5aTiNvRUOT56BN7CktlJhEEp4mzswpNo+cDGGie3s
	9aW5a8g==
X-Received: from pldt14.prod.google.com ([2002:a17:903:40ce:b0:2b4:5ded:6ecb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d58a:b0:2b0:ac1e:9737
 with SMTP id d9443c01a7336-2b5f9ec5ea7mr159040275ad.12.1776720033096; Mon, 20
 Apr 2026 14:20:33 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:19:59 -0700
In-Reply-To: <20260420212004.3938325-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260420212004.3938325-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-15-seanjc@google.com>
Subject: [PATCH v3 14/19] KVM: selftests: Rename translate_to_host_paddr() => translate_hva_to_hpa()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_222039_607673_9ECE9657 
X-CRM114-Status: UNSURE (   7.86  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Rename arm64's translate_to_host_paddr() to translate_hva_to_hpa() and
update variable names to match, as using "vaddr" and "paddr" terminology
is super confusing due to selftests using those exact names for *guest*
addresses.

Opportunisitically drop superfluous local page_addr and paddr variables.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/sea_to_user.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c b/tools/testing/selftests/kvm/arm64/sea_to_user.c
index 7285eade4acf..fb06b9dcb3d9 100644
--- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -56,13 +56,11 @@ static void *einj_hva;
 static u64 einj_hpa;
 static bool far_invalid;
 
-static u64 translate_to_host_paddr(unsigned long vaddr)
+static u64 translate_hva_to_hpa(unsigned long hva)
 {
 	u64 pinfo;
-	s64 offset = vaddr / getpagesize() * sizeof(pinfo);
+	s64 offset = hva / getpagesize() * sizeof(pinfo);
 	int fd;
-	u64 page_addr;
-	u64 paddr;
 
 	fd = open("/proc/self/pagemap", O_RDONLY);
 	if (fd < 0)
@@ -77,9 +75,8 @@ static u64 translate_to_host_paddr(unsigned long vaddr)
 	if ((pinfo & PAGE_PRESENT) == 0)
 		ksft_exit_fail_perror("Page not present");
 
-	page_addr = (pinfo & PAGE_PHYSICAL) << MIN_PAGE_SHIFT;
-	paddr = page_addr + (vaddr & (getpagesize() - 1));
-	return paddr;
+	return ((pinfo & PAGE_PHYSICAL) << MIN_PAGE_SHIFT) +
+	       (hva & (getpagesize() - 1));
 }
 
 static void write_einj_entry(const char *einj_path, u64 val)
@@ -303,7 +300,7 @@ static void vm_inject_memory_uer(struct kvm_vm *vm)
 	ksft_print_msg("Before EINJect: data=%#lx\n",
 		guest_data);
 
-	einj_hpa = translate_to_host_paddr((unsigned long)einj_hva);
+	einj_hpa = translate_hva_to_hpa((unsigned long)einj_hva);
 
 	ksft_print_msg("EINJ_GVA=%#lx, einj_gpa=%#lx, einj_hva=%p, einj_hpa=%#lx\n",
 		       EINJ_GVA, einj_gpa, einj_hva, einj_hpa);
-- 
2.54.0.rc1.555.g9c883467ad-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
