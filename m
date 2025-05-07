Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62859C3ABC0
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k56u6B5sGLApphYdjc7zxQDoDdb1cRDd5QOJgoQkl5I=; b=0iDl8GfOK+o8wV
	8et3J9HYe6SH16ZawP6Yhh4FIKFUc7p3cBet8K0W48cf3zlqc320mAo0+WuCIa/XI4g7BcHhYzHzD
	jVqOR/kfZ2bgo8xtpNnU+NpuGkavLCD370Bkj2WjEtb9ZYY9yKJk3eEx80Q0jRAc/SSKP2DDxTZdS
	XeSBrOXwGqflrU78ztAAKxTCKGsG+NriJni02oKfV3hGCqD+/FIJ79K/4q8eGCY+EMqjwtYYqkx7W
	/My4QyRoBttxNL6KvQXONbgLb7B+WsX5LuZiDpOi9WAUsSEtnubSQW4f+FPKXXQbM4/14jyIiM60v
	ZLYv9eQnYT1JzKFRWwCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWz-0000000GIdF-2kMT;
	Wed, 07 May 2025 17:26:05 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChEC-0000000G542-23yZ
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 16:02:37 +0000
Date: Wed, 7 May 2025 18:02:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746633754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4sAt9jGqtjjuAu3AgUOHLrQORncUHd8FqoP4fvAA0kg=;
	b=qnydbb3xFdGbLQifmPErPW1DnOoiQgr2a2V28pycc4PkDj8V7yypsPLcvozd5Sq6E4YFjI
	bzWOadRjXBPASa/sWwBsVRH4CnEeWAtpDr7WRHM7m8DQM0gEbzoKVHTHFaphzKWAEAcnhO
	80z3pXFEcgz+TmwJjMBc0VLlEYYCE3g=
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
Subject: Re: [kvm-unit-tests PATCH v3 03/16] configure: Export TARGET
 unconditionally
Message-ID: <20250507-78bbc45f50ea8867b4fa7e74@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-4-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250507151256.167769-4-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_090236_675948_BAA61F74 
X-CRM114-Status: GOOD (  10.83  )
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

On Wed, May 07, 2025 at 04:12:43PM +0100, Alexandru Elisei wrote:
> Only arm and arm64 are allowed to set --target to kvmtool; the rest of the
> architectures can only set --target to 'qemu', which is also the default.
> 
> Needed to make the changes necessary to add support for kvmtool to the test
> runner.
> 
> kvmtool also supports running the riscv tests, so it's not outside of the
> realm of the possibily for the riscv tests to get support for kvmtool.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  configure | 36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
