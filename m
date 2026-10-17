Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD2DCCF2C1
	for <kvm-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 15:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvYxzJ0Dth1hEkBTQk9ht1koGl16LcBZKXkN5wawNDg=; b=yOKuJE9jIeVWAt
	3k4kmrzy03kbjAXZ8v6iVQSqlfGMHajW77+Mb75LFQP9yaYUNNkUteWRrbgTWCiNbnfu2ZdINwujy
	TknC5LiYm9bF4uIXhelmMFMt0QRjWD+PDbsTYggwEjKNoHbX3hFjmbLFO84TQyusoH6rsJxycGmOh
	VTjNf/IlSU3HhG3g0opH74cOe+hLR3hwTsDgDVrmEtwqQtN0DPnmJZbqOw+lTIpNn+M0XYJ3CUoM2
	18/J2hsJJYA1fEQt/jOhl+MtRMBswyV0UL+pg1JZLKuivIMMBSs42mVCbY/ae31C9ImbDVOckN9Mb
	qYhCd8yVCo3Ca5/ZVljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI6Hh-00000004sVw-3arp;
	Sat, 17 Oct 2026 15:25:21 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI6He-00000004sUo-0K8S
	for kvm-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 15:25:19 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-535179e995bso9902631cf.0
        for <kvm-riscv@lists.infradead.org>; Sat, 17 Oct 2026 08:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792250716; cv=none;
        d=google.com; s=arc-20260327;
        b=mQ654v4niaZAKzckutMrCk2XSfHzRzZ3oXo/JttXF8DyQAo4nR1HxElgrAqylCN5qO
         7AvOCR+//kFRy2gATFkzFSUjZ4iZcsY7IhikGURrVREyzhE2YJqtrTeCZtiFFpT84r//
         0TtveVX+RXKxIpVBv5JMogTtIAUoSRTVwOr0bldxmKo8VkdQwiVZaC1WRtR9QCJZVQ/P
         YbKU+fIWwGF814j0tjbdoxDsu92lWyPGXGH/qh6rD4qyKmIlrFpJJjnWUyzFL5v/jDZO
         i6zAoPU4Htl3+C0o6vCJokuLnFSEfbnfO9imtRwshigq7XJLVjGz2yrPQU/41Dxq+lwQ
         46yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cBiNZFwCvoEsAVFQ+85lVVDF8nZW55yFDyjuRN5OJEE=;
        fh=cD1sKb0eWhWQXfoJD138ZiADWHviZte8MPGhRneJXBo=;
        b=gUrt/s8eQmqJTCLP3MdjGCN22MA0c+sooTL+SxEP2wr36j8M7+X/lnEu9nMIkjgm4A
         87+6CnIhNvvfkynj2pmnWV3xRqIyq/sdG4wcqMneFCEld28xj4OeZ9BxiiampcAiqrsR
         jDGnPXb92LRngz9iVduKXdisBhgQg6AYQG1UyW2GdVkLGqKOAnBMC8M2hRUZ0q3DRl1U
         ZZ/oQPqnWFmKvtqt9bJltK/bYmSs3P0ntmIjplNpMkqnqC63grKVqk411TYNglZzmCR1
         xe8qOE0itFX6tsGIKouzETdYsVh2jTXkWKBp+tz5j9AQm6jJsRiD8lrZsAJdJH7zONtz
         5ylQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792250716; x=1792855516; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBiNZFwCvoEsAVFQ+85lVVDF8nZW55yFDyjuRN5OJEE=;
        b=PTznQW5bFH1/LSLOqaDPxujZM02lhDU0K9RB/voeKTNOKxJMGykq3wZ5mpMWUEExem
         eHQTowGQrIVQUzamMpGoYFzVmdgQNxnlrO+S/OeGPH/werUTl0Oy6KfQ3ACRF0qrUtLt
         GFXL9YW2UxQMjeVCCAeQcyjbnxIE9EdSKz5zHtIrMT3bZg1Rha50VGFDhzfC5F3qVqFK
         acEAWVxGv5jYOPDJDLCE1XMBWPD2bp6urRLUJ9Netsba6e89BQsADLzyK/JTIpYFSomu
         s3inpyhK5ig6j1kK2zQDfSQ6zPsvF6KQ5/VbaYZipydU9cL007HKZfATta2kG2ZA8+sn
         xbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792250716; x=1792855516;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cBiNZFwCvoEsAVFQ+85lVVDF8nZW55yFDyjuRN5OJEE=;
        b=njjgstn4FxLpIKzIoxut5CzzLQxoGRgxCSzmo1Ik/98OiUb6Sk2i50JGjALAPoNudP
         GdlXxgNGGlpaFvuTk50mRLf7weOchKCveAyZKz6vIXopHksHaRrbsfk8wN4dH2dKi+A5
         4cpg3b4wJqrtU0oph8AAQiXdJMbND/LeruDbBnq8tgPOk8tlqDLlU+Gg5AaLHJf+njzi
         ua4NsvVd+k7KZvPbBnaRyjm/8zhqJ0ZdhO5ubQNtyoVJyjmcZtK06wVZM1ZcG8DYT/c/
         m/ZJmyY9ugf1+06nfb50ij5v5FJ77lhevwxB/jYTW6mOh/mAj/q8v0CRIRUaT+pBcvz8
         MKCg==
X-Forwarded-Encrypted: i=1; AKwUvBxyGwXxhPL+PtkQ76rN+qTZW3Shhv9dnYRPZsxRAdtpkIQUYGCwWN8TiAp6LK/E72W7C4v4SEYuruA=@lists.infradead.org
X-Gm-Message-State: AFq9FYICZj7RcywZKu0DSMZPi9/su0OW+1hRvTvkr9aQ8Of1ax/XpGZc
	38yziXdBXtT6gFv523gksg145UgP1RWa5e690ZQOy9PXEzu9EyodkJ+Ts5W5mCRZPMEeQSdFfnu
	HtnH9ToCKTKHbzkjD9cEXDvgGn7ZjSZs=
X-Gm-Gg: AYBFou1l0laAwk8h96WtnaJMbX5W+XQPRcZ95QWMAuw9jZZ8pLSljRs6ec9E17uWbw6
	p1nisq3xMdaYwvH+J01mePVeAF/mvLgfZxu4XfCLDEDLLz2J7IdjizzQ3wqBLxdAKc9KewmKEoQ
	ept0hBTmg/SRhxDazMh7DT/BUe3U969jqSDib5VjHnUZo5gqgnG+vzoTCvRC/8i/HVFwge8yZwh
	XwBDevEH0/hwL+Dr1diGL8sas4AiOCdmy2RCEwzTRPDuJ2K6zVKHtD8cTDmK1M0hX69JnVZOmo2
	NNMafEsafZSXcTaEoaup6KsWKxbOkb8jvW19NkWT38S2GrYc4PtMwMjhKtsE4BhVIMtyXhh2iHv
	J7+EvI1PQkczBP+Lm7sjbgwZCEix+dYkw/aEVGL18YNtsjQ==
X-Received: by 2002:a05:620a:2783:b0:93e:d051:8f19 with SMTP id
 af79cd13be357-93f29ced575mr485953085a.40.1792250716444; Sat, 17 Oct 2026
 08:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20261017110213.46199-1-tharitt97@gmail.com> <20261017110213.46199-6-tharitt97@gmail.com>
In-Reply-To: <20261017110213.46199-6-tharitt97@gmail.com>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Sat, 17 Oct 2026 22:25:04 +0700
X-Gm-Features: AclHuK8Bu8EDo40zZmiyUcWdeJAzBkx4-shpMZtTbASYDmEugT246DxrXg3J2Ik
Message-ID: <CACak8wNa-dbNMGO=4U=JpTqSYWdk9MC+DWZS3WxRwuRRvC1T7g@mail.gmail.com>
Subject: Re: [PATCH 5/5] KVM: selftests: Test protection of the ucall MMIO region
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_082518_126800_7A5ACB99 
X-CRM114-Status: UNSURE (   6.44  )
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

> +#define CLOBBERED_SLOT         TEST_MEM_SLOT_BASE
Upon self-review, this should have been hardcoded to 1 (to clobber the
reserved ucal mmio).

> +       ret = __vm_set_user_memory_region2(vm, CLOBBERED_SLOT, 0,
> +                                          vm->ucall_mmio_addr, slot_size, slot_mem, 0, 0);
> +       TEST_ASSERT(ret == -1 && errno == EEXIST,
> +                   "Expected the ucall GPA overlap to be rejected: ret=%d errno=%d",
> +                   ret, errno);
This should have been errno == EINVAL check to catch writing to the
exiting read-only slot.

The earlier test accidentally passed because it used a different slot
ID (=2, not reserved) and received EEXIST for overlapping the reserved
ucall GPA. It therefore tested GPA overlap rejection, not the intended
rejection of overwriting slot 1.

I will fix it in v2

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
