Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C3FC021A0
	for <kvm-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OQEsE3v7/j/IxnV4TeZtJd9P+SOyO2H8VHpANxgO5U=; b=iEGsSMGIv4INbm
	No4Rj8bbpkYYOZyfycqTeyN34599WibUCeFo9LaYIl2diofun+QOIrb898rVJ4hx1/F5RJgk2Cnrk
	81detoAhhkHqYmrErzEHix9x/uA1kXybvHhh7/wNhpHXzFpD2t1K8NfEsbdwfTqUqk3Fr37CdmIvW
	/2eKX5G2SbOGcjAzrI3+/DX7ULVKCl8aiLgD+rKVK6v1qxkBc+g5rPzaNVyEEjuqe5UiSDZE9anLS
	nJauINzufluaSiimrLA7epWi7zcyLD8Hz/Oi3tAWaEOx/DnMVcoaKPdX5SobyRJnjrzBeZNulUkSC
	dNna5C41h89kiyJDrddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFTp-0000000837J-2ljO;
	Wed, 12 Feb 2025 16:20:53 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEyy-00000007vJe-1bWu
	for kvm-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 15:49:01 +0000
Date: Wed, 12 Feb 2025 16:48:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739375333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vmg0L/g3+q0yTaB9LWuHIF8QkwBzZd4h117MfIen5LQ=;
	b=c/OgCsn7kQs98DTIPDKyRY9IWuczp96fsZXGkUJNCxyBQ3Vuz6s8GWJ62djGUbxKpC1yWk
	I7zWfhyo8zlAy4AiQFrkZVib9LGSyoTypCUCRw8hliUvQPNi40nHB0vTSXQqKFW9IEIjL8
	Z5yFO3yLd2b9eklxpPjom4HHbQciLf4=
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
Subject: Re: [kvm-unit-tests PATCH v2 04/18] run_tests: Introduce unittest
 parameter 'qemu_params'
Message-ID: <20250212-8427334ce25d709f70c4053c@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-5-alexandru.elisei@arm.com>
 <20250121-82874afe4e52c828d21e7da2@orel>
 <Z6yk48JpsYKHwFye@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6yk48JpsYKHwFye@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_074900_634075_3F313ED8 
X-CRM114-Status: GOOD (  17.63  )
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

On Wed, Feb 12, 2025 at 01:40:51PM +0000, Alexandru Elisei wrote:
...
> > > @@ -80,7 +80,7 @@ function run()
> > >      local groups="$2"
> > >      local smp="$3"
> > >      local kernel="$4"
> > > -    local opts="$5"
> > > +    local qemu_opts="$5"
> > >      local arch="$6"
> > >      local machine="$7"
> > >      local check="${CHECK:-$8}"
> > > @@ -179,9 +179,9 @@ function run()
> > >          echo $cmdline
> > >      fi
> > >  
> > > -    # extra_params in the config file may contain backticks that need to be
> > > -    # expanded, so use eval to start qemu.  Use "> >(foo)" instead of a pipe to
> > > -    # preserve the exit status.
> > > +    # qemu_params/extra_params in the config file may contain backticks that
> > > +    # need to be expanded, so use eval to start qemu.  Use "> >(foo)" instead of
> > > +    # a pipe to preserve the exit status.
> > >      summary=$(eval "$cmdline" 2> >(RUNTIME_log_stderr $testname) \
> > >                               > >(tee >(RUNTIME_log_stdout $testname $kernel) | extract_summary))
> > >      ret=$?
> > > -- 
> > > 2.47.1
> > >
> > 
> > Hmm, I'll keep reading the series, but it seems like we should be choosing
> > generic names like 'extra_params' and 'opts' that we plan to use for both
> > QEMU and kvmtool since they both have the concepts of "options" and "extra
> > params".
> 
> I'm afraid I don't follow you. 'qemu_params' was chosen because it uses
> qemu-specific syntax. Same for 'kvmtool_params', introduced later in the
> series. Are you referring to unittests.cfg or to something else?
>

I didn't like the renaming of opts to qemu_opts since both kvmtool and
qemu have "options", so it seems like we should be generalizing variable
names rather than making them more specific. I see later how there may
be a need for qemu_options, kvmtool_options, and unit test
cmdline_options in the unittests.cfg, though. However, here, it seems
like we could still use 'opts' for the variable and just use another
variable to determine if we parse qemu_options or kvmtool_options, since
there shouldn't be a need to parse both.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
