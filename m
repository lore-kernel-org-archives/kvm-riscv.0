Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EF8CA5FC1
	for <kvm-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 03:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdOlNz2DhrYshZG/HfWtk2OnZWgndWAa4s5I0E69i0E=; b=2Z37JiPVoO7BhZ
	Ji9z5ZQKm40a+VTJvy5QF6N0rwG8z3ZnijVZJqvqlOvG9h9LdsLH4MouoGSi2cd8ElLGdFStZETJH
	PhErboI4B6x6cBn+fXcGT0B1pPa20tCkYsfygR5HcLaAZoTSA/+91rdXNaBFvYm2s2vsMBFs0rr82
	El4OxjEK3FEo13YIf8UyY/BQ546AuwYArML/i+KuiYe1HkUSOQTd8AGIR3zvVZt841WkAquIfOaPx
	ugERym23Nppd5OQllBruhUcRgz7rj0Hr0014FxKmMuJoY89KSY5n6OYEkoZyGzdnNxroZ7YV5nwoE
	+0M8vXz+Gikp9XFKC7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC73v-00000007dWM-3Sv9;
	Thu, 01 Oct 2026 03:02:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC73t-00000007dWC-3mIs;
	Thu, 01 Oct 2026 03:02:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ACA640416;
	Thu,  1 Oct 2026 03:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1291F000FF;
	Thu,  1 Oct 2026 03:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790823741;
	bh=ESWOgs8pthL4jmbP6/5JXBqu6W3vx75aJI4JxJVxXSs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=R6AEfScXRENdXKHujYsvSw3LlfeLTXBYuicWRQquboXNP+FZy7yZuMNEkbGSkqX66
	 mI8wLVbX04wVCmIcG+mvgiVrvk5VSG7VIG4tVnkX7tfnCEt5kPEw4H8mvn6hFO64l0
	 bAqB/oLjNMhYXHGrkMy3ddePs1ynWeccpeHtOTavExBBiDSlmiUYZILjWV/o2C4BRf
	 XPoVhTelNYsSJh5/lluiUXssDVK9UEL8DzInBsHwiobgQVauUwGiGZJ4KQIoIzFYq0
	 uDlPfPOVNIKzG8cJEOxmtnRQ51tpyY+Jz86BWzKeydMvWPDS+EohKcYOKxJfGHq3go
	 a5D9SPkUpLCSg==
Date: Wed, 30 Sep 2026 21:02:16 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
    kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2] RISC-V: Clear HSTATUS.HU on CPU initialization
In-Reply-To: <20260924-hstatus_hu-v2-1-7e970f5f1d8d@sifive.com>
Message-ID: <9e3dd333-2747-45dd-6880-2b83a3778f66@kernel.org>
References: <20260924-hstatus_hu-v2-1-7e970f5f1d8d@sifive.com>
MIME-Version: 1.0
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

On Thu, 24 Sep 2026, Yong-Xuan Wang wrote:

> The RISC-V privileged specification does not mandate HSTATUS reset
> values, leaving the HU bit potentially set after hardware reset.
> When HU=1, hypervisor instructions (HLV/HLVX/HSV) can execute in
> U-mode to access guest memory, which may cause unintended behavior
> if not explicitly controlled.
> 
> Clear HSTATUS.HU during CPU initialization to ensure hypervisor
> instructions are only available in HS-mode, preventing unexpected
> guest memory access from U-mode code.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

Thanks, queued for v7.3-rc.


- Paul

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
