Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F70C3ABC0
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRv21qZEjbNPtnJVHt0l7BFxJdr+AfLyjlkdAyjWXZs=; b=XvDA22z0N71g0U
	BdvA0aJ3BtQZVjzAI9WWBLnY+ZK+fcGSm1EtqNsH8BWWlHtHml7pwfObL/6Qy/PotYynRhpcjKPKw
	vWGxpL/p7VBmCRt/A7TWE4aqXbLrp2APZLNqy8z7Cj4qYbYwz9sbCjVHqXLaujgrgnjRCHw+WiDgw
	Hz8Wn/zl4LAPw0IsR3mjroUDGumJkV8BZ5xEdocR/a+8i2ol2GDsDbm5caQV/jjygPB3DXGI7+yde
	vxE/e8rIRQGWPyF+weN2TI8W7yBXVzcFwDubRHhv607i3cPeprQZ+4IUZJT605703xcnKQPcilAls
	YBYgNXg9ViGHf3iu9Y6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChQC-0000000G7dg-1sGn;
	Wed, 07 May 2025 16:15:00 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgst-0000000G0Ut-1Was
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 15:40:37 +0000
Date: Wed, 7 May 2025 17:40:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746632421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=co1RakSltze73RhSdPe5+tIxebPBqHB81ZkmAHOcpdM=;
	b=m+ZnvXRqSSY+K2f52Ea3a1FVRh25m7NSG5ScE7WOkOyjZiNL+rdunFIZHB6LKaYcrDNdR+
	YkWRy/GrECWURW27zLbn9OGhYuj5Dlku3tkYdTOBfmQBW4ZUZl2gZ1MRtzhPQB4bTsAPmP
	bMppl4LQ7OBTi5T6yUWL3oN+mgEz6DI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 01/16] scripts: unittests.cfg: Rename
 'extra_params' to 'qemu_params'
Message-ID: <20250507-97151633d3faefe9bd41b7f0@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-2-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250507151256.167769-2-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_084036_083330_1B46E30A 
X-CRM114-Status: GOOD (  13.82  )
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

On Wed, May 07, 2025 at 04:12:41PM +0100, Alexandru Elisei wrote:
> The arm and arm64 architectures can also be run with kvmtool, and work is
> under way to have it supported by the run_tests.sh test runner. Not
> suprisingly, kvmtool's syntax for running a virtual machine is different to
> qemu's.
> 
> Add a new unittest parameter, 'qemu_params', with the goal to add a similar
> parameter for kvmtool, when that's supported.
> 
> 'extra_params' has been kept in the scripts as an alias for 'qemu_params'
> to preserve compatibility with custom test definition, but it is expected
> that going forward new tests will use 'qemu_params'.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/unittests.cfg     |  76 +++++++++++------------
>  docs/unittests.txt    |  15 +++--
>  powerpc/unittests.cfg |  18 +++---
>  riscv/unittests.cfg   |   2 +-
>  s390x/unittests.cfg   |  50 +++++++--------
>  scripts/common.bash   |   8 +--
>  scripts/runtime.bash  |   6 +-
>  x86/unittests.cfg     | 140 +++++++++++++++++++++---------------------
>  8 files changed, 160 insertions(+), 155 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
