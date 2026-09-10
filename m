Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5319BC79FB9
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 12:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ED4WbnQAR9e1dnu8QfnEI4G5NpO9hUfvjtxJU0zs/y0=; b=flP0uw9Npn8kHi
	rW9ktwamwWjtxRQzN5MHExbFK6XWS2VydNqbb8USnXVr7ejmSgo5pAPbhiE5eob0mA/j7lakdxR0+
	bT94IXHn6aje+ypAAPjCVHQ13TWR/L7X6NtS+ABchAvUeXX9EKukuy6n4PcbGwEYGAOIA8Webg6H/
	TkOk6+39gfTSlvJlpgj97hmqBTJQEK35LCcUvtLBt8nFqZy20sffHh5NwwYQ+C2atUr3hvZTott38
	92uLRz3Ki52Z80FLJT3m7kjWnWcvr7j9eDWGRriqa+c1ua3rhuSoj5of0ezrn6WTY6uCfAbRwwUrK
	3ocY9AN2PW4aMh6nq/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dX2-0000000EIL6-3gry;
	Thu, 10 Sep 2026 12:05:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dX2-0000000EIKZ-08cX
	for kvm-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:05:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Message-ID:Date:In-Reply-To
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j5p0fnZhfsutRgdRJoA23rs+n3VC6+9xK2KvWtfvI90=; b=mNSozV6P+wxDptuc/UpNQsGHrM
	Mk3oz0OIwvHt+DplyZgwhdyEItKwDrLZOfmTqTATX3LxlFsMQ3Ot68qTZFBHtRu8t3va4kaItuAJq
	6cxSefmkX7rmBegUJrzjIZ2Frwo3JxeBYX7rFKxTTpzs5Tj6WXnrqKeGA+rQShpzXCZOMIMEX79tP
	R7ONaIbpWHzLYGy6TH8lqz6+sYeOWqyqksQYLXo+qnwA1gp8xOQJ8jqsd+cZ08L13dEcCRPSAYwid
	9AajAw6m/OdOKv7sIIs1Db6ko9A9zLfZfB28esv7bkLpCurbgBGyKFGKuEiz+hTW27FEI0qghx54G
	2noASsSg==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4dWz-00000002RTD-0hH5
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 12:05:30 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so289917a12.1
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 05:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789041927; x=1789646727; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j5p0fnZhfsutRgdRJoA23rs+n3VC6+9xK2KvWtfvI90=;
        b=d3zaaHPApCf6kyW9z7pmJzrLfKhf29HJLpjSA5dsEssqMWqLIjsj5S0SSjoj5777t7
         H6FMfpsl4EqTxPa3t82q9XgWdMdmO4zBn71X+9BoLOw0coA4b1XzTZBm2V+BXsMz0eah
         cxq6I+n7hbeewF8jWQmKF0N/p4XNbWxiuOwfEThdwUKJL5PlMSTJFepldUcvon7UgCg7
         LFTrzpjaczFO3/YSuSXPZLnC8hEZU/IwI29ksZlPynEM10ctOHFqvVLVqOsO3UmhUnO/
         qCbRrP2BvpKoPgpcPCNW24Hj16/9E8UoqNQiryr+Ii4aJ1wDUpzpStB/iWgGdPbVD9c8
         bffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041927; x=1789646727;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5p0fnZhfsutRgdRJoA23rs+n3VC6+9xK2KvWtfvI90=;
        b=Nl+52VTcehDbfOH0xQySus2w1U6sjjeaZ1BArLRXCh0eqRuZT0QBIwXq2ekJpHHkWH
         887Fm9VZ0ZnRpZdZeLQT1nhIibSIOTW86QqzoH1pUP3ov9CVTlEDlnGo5DwDDPyaCdai
         vxkm2hmZmTZ9oEbGPSPqqslH9Wb5CNhH5Gc9YnDqkWP4de8gZYcojbvZBZikHlVwvkQB
         hyaDtO4PNDGgDPztRJVm9+w62JYvlc0DWj2+jHb/0SK3bNiJK0u4pITk0d6wXZwOKt+/
         XfJf81qcYim9/ecYOCf8A0+QadjPKEPuBi2Si7fl8497py6I2KJyB+L5nWWQw/ONdeb6
         nhqA==
X-Forwarded-Encrypted: i=1; AKwUvBz5jTvN5AJH8DICgA9H9dEFCdEQtRzN2JSBnkEa6zqZvlCZtKncUxx320gGTENduWd2E2AUtHb8xUU=@lists.infradead.org
X-Gm-Message-State: AFuF++lcLM/mVr5+5nilcXl7yzYO8ywbZacuROaqJRsOSboAbJp8ra7r
	5lI0AB1Y1Oulzxkm2WipDHS6TlTWt+NHHuKdOFJj89oRJla5v3V4c5ct
X-Gm-Gg: AYBFou2VmeXFLXjJHcCVwloEpgF1e6PoZVBxU2TEkHBPLGt3NgfvU+MOeVIeIPVwBvT
	U8E3rtgmkdVyrROFQjCKwnu2oQb9OAlsE6GZX3mebcVXzuKUkMRMa1ZDlpZ1Scv9ZwSRnSHIyVf
	5pnFPumvh5dJucmkPaFZMCjQLOxfuy9OhfGrhy4sjxNt4bb/uqKSJQPvTLk1HiGvfsOTjOVssKO
	kgxU+pZ9bAVz+N5NyBL0EX1ii6HcIQ9c2jBQcNvtaDgAyvoGrO9D6YhIyM5IXSKYA2a/05QUmod
	2sJSj8sAHwbpvAEbIfljdVhigOvuvmj+LSaBtQacB+kUizDuazm7ggX6ZhPe58fHu8aUCPvVNIs
	UnG/ZfBdeu2xwbI0VvYUDwM+A83+fs+6FU7orE8GSLTaQ6D6R8lTIS3udtaca0PFbtoQ+M6UyPq
	Ly4AZFJqt8+tHJ2V1mdn5juHe0srng5rE5MubQXnwwbfbJA4oVh50dbIZGcomjoOWRqyxTtPr8u
	2uDaYZVCG/6u2snLoloafSiYaIDjvH/rSG1ImSJbh9a45mApWARVRs=
X-Received: by 2002:a17:90a:ec8b:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39d70bb1bd0mr11567376a91.19.1789041926812;
        Thu, 10 Sep 2026 05:05:26 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm59190560eec.21.2026.09.10.05.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:05:25 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 20/20] KVM: selftests: Add arch hook to force page tables to be naturally aligned
In-Reply-To: <20260902164123.2546762-21-seanjc@google.com>
Date: Thu, 10 Sep 2026 17:27:18 +0530
Message-ID: <zexpz5cx.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-21-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_130529_326746_1C29EE85 
X-CRM114-Status: GOOD (  10.43  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Add an arch hook to communicate to the core physical page allocator that
> page table allocations need to be naturally aligned.  The hook will be used
> for upcoming PowerPC support, which has MMU tables that are larger than the
> guest base page size and need to be naturally aligned.
>

Thanks Sean, for these patches. I have addressed your review comments on
v3 of PPC KVM selftests support and ported those on top of this series.
I am still in the process of running the entire series on a real HW
(and some todos/minor changes to be done).

Will soon post v4 of PPC KVM selftests on top of this change series.

> Bury the hook in the physical page allocator to avoid having to plumb a
> rarely used param into the main APIs.
>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

As for this change. LGTM. Feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
