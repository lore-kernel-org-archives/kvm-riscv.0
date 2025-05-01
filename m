Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4544C369DC
	for <kvm-riscv@archiver.kernel.org>; Thu,  1 May 2025 18:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B+8zKxUCBB1oF8AX3yNW9tRDKYF83iWLhcmKy5HXzzc=; b=jlzvVZdRLlmDdvOvUtmIo9prSY
	xoHi2N3K+eAqla9UbpMSIohowxWbEpd/Q3WL0EoSzcBNSu8puaKIygU+8R5xLYqoV/Lb2O9FTHFIC
	vKe1Cp770AISg9Kk6BYGKqZMAoCr8GCokGHy4o72bZGE2uzPjT/RRzihLSKJ70V1AuV5WGcZYm9Rk
	lbC83HsoqWosypZrIFyDL6w8XWdzZURzT+thgqPdCn+2/tg+GEvUuvPNnrWONjVPRwQTRVAwq1z5F
	4lCy2aLym2HbIDsFpVzvUUXtE/bLlgvf7O9JX9f7T1A4J/7Dcs2oXXr9HGQnlxuxSfzemVhQcUA63
	UGypti+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYxq-0000000GPpZ-2bUP;
	Thu, 01 May 2025 18:48:54 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYiw-0000000GN3T-1oSn
	for kvm-riscv@lists.infradead.org;
	Thu, 01 May 2025 18:33:32 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-af8d8e0689eso1364769a12.2
        for <kvm-riscv@lists.infradead.org>; Thu, 01 May 2025 11:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746124409; x=1746729209; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vmZxT8OePR70IlcHk3w9PyaS2Ebe0ZK5Neg7TiicVTQ=;
        b=pa3Lu9l++laFgtmYXmUZWk5wvThXijygfsfjEPacMinf19i3YZW2lxtT2Uh/YARy6P
         xAekJxx+7njnVSCjBhqLm/lIjPIDwL2oXoYOiGBpxE6nblOK3eJZ6X9jTxvYHzASJi4A
         ihWwq9yvkmPN53+F44LYROT4UobY3q54ntANt+Splke9RlDWxpUgeKBwVWUv7ROTmniM
         Q3ZYwHUPXy08amiZI1JlH6lNbRQ2U+JGL3PJhKKM9+rsMMbUw8rAAHdygFFu6zGV3LHG
         mIGyHOOKpLPnBtznuu6HTA0p8lNIN3fX4hu4HxR8zYnSmTizV5+BSrtbH7tFY1P/x66F
         IkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746124409; x=1746729209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vmZxT8OePR70IlcHk3w9PyaS2Ebe0ZK5Neg7TiicVTQ=;
        b=NYEjFFicXIrxiCJvGjUfiTtW1r89VBZ1CIXa02oyEuT2Xi4Vz6WIa0rbRfeY/VbXZ3
         Gefx71r0q5z/R8om7mEF0TmI+E04RsSe5xMgg5zK/vnI+TYlpELGdg2np4rJOJ+0gWEL
         UYRfr5Vhka4gh/msW329TGeDXCzFMIhGwZXgjKksDeLS6y9h1oApInQRAuDzF5eshlJn
         JdYixToKC498El/QK4yFj18/7kXpPN4CaBhaVcbsOOD7CcxijXmmq1g1/sNIcxntJqWQ
         vNLc8yUg4tllNA73PbkCcWNjUyhVgUL720eTybOsUr+kiBkl/tzjP6bvR/Bih2XPahD8
         xSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqUp8CvDxQXQzGnj5UbM+c7z98qeATKyJjcVSmuoIhZ/l/4ux14fMgCLaqVRFwgwW9pQtE34K/aT8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyykLLtaPdy5ZvqK+QfBEC1znwSC+xX/yha2dyh+bEFQWoeAGQo
	3q1mg0PyFYj+asz9m9wrsIL0RZ8RvH8hcSGFJ02uy4zM2slznxqOgwF6j9mCAwmN2ddgykf0PfH
	RzYNgRACOrQ==
X-Google-Smtp-Source: AGHT+IG7ZB54jjneYfe1tn18St+FGK/8C/RP49qADT4OdwlvOWaJA1tk/v3Dm4OeF0p3gO05OEVmZwLAOdDMmg==
X-Received: from pgct19.prod.google.com ([2002:a05:6a02:5293:b0:b1b:54f8:d2ee])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:1587:b0:1f5:8262:2c0b with SMTP id adf61e73a8af0-20cde46dddemr28056637.2.1746124409090;
 Thu, 01 May 2025 11:33:29 -0700 (PDT)
Date: Thu,  1 May 2025 11:33:03 -0700
In-Reply-To: <20250501183304.2433192-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501183304.2433192-10-dmatlack@google.com>
Subject: [PATCH 09/10] KVM: selftests: Use s16 instead of int16_t
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	David Matlack <dmatlack@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Eric Auger <eric.auger@redhat.com>, James Houghton <jthoughton@google.com>, 
	Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_113330_472576_BFD12747 
X-CRM114-Status: GOOD (  12.82  )
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

Use s16 instead of int16_t to make the KVM selftests code more concise
and more similar to the kernel (since selftests are primarily developed
by kernel developers).

This commit was generated with the following command:

  git ls-files tools/testing/selftests/kvm | xargs sed -i 's/int16_t/s16/g'

Then by manually adjusting whitespace to make checkpatch.pl happy.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/lib/guest_sprintf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/guest_sprintf.c b/tools/testing/selftests/kvm/lib/guest_sprintf.c
index afbddb53ddd6..0f6d5c3e060c 100644
--- a/tools/testing/selftests/kvm/lib/guest_sprintf.c
+++ b/tools/testing/selftests/kvm/lib/guest_sprintf.c
@@ -288,7 +288,7 @@ int guest_vsnprintf(char *buf, int n, const char *fmt, va_list args)
 		else if (qualifier == 'h') {
 			num = (u16)va_arg(args, int);
 			if (flags & SIGN)
-				num = (int16_t)num;
+				num = (s16)num;
 		} else if (flags & SIGN)
 			num = va_arg(args, int);
 		else
-- 
2.49.0.906.g1f30a19c02-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
