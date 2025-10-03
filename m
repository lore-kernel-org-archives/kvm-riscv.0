Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13B8CCA470
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 06:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJuG7Psz21Ztdw39KBCv2Xzh0E3c3h/fbGL4TyTMZ0k=; b=R/nx1x1LW/tG/U
	botCJRgMJ8Y2mcTLncM4GczHbMEhATXOPimd6pQ7xBx+4RWNYD1ZPZhfDZ0xC7nBtowgx56nfIXNu
	Rf587zkqJTDlDLJmNceDiRpO7KdCk1INpOtbVTsclPzVpVLQFL4zaPvlavRSorLdf36qIu/tcq/kP
	b+gA3tb98CZmW5V9n8l0kASsPIiZc+E36wiD+8OpdOKy/hpi/jw6ZWsK/vp8I3ENq8+aJTszFwMLC
	DD81B4khuubpoGwTuMnh7qq12vOuNcelHutRefVWEpQyUqyJNYfOEmuTlbxfKrn932p8nkOzH/L8S
	k8ZBS3GJURKzR5xpoehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ZS9-0000000BkOk-0laO;
	Fri, 03 Oct 2025 06:39:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ZS6-0000000BkOL-3Ldz
	for kvm-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 06:39:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-27d67abd215so147335ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 02 Oct 2025 23:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759473577; x=1760078377; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7NUJR+0x4Extu7PhnW8nn0TsoPMkUfDkUjklFIsZ2dE=;
        b=VoCwX0HzUwNc7JUeAsVdnbCwCdGJdI/wteB9PatWPDgP9SY62Be1geNi7hthEmXH7r
         7g4YWnta8xtmweeImQWfl2sfTE9AWVN7tU/uLqurUcZUom8xzxDXGEvvECueH5CtMY/p
         IhftyXKaHNQOMNl8ukNjwWZ5slxgvIay70p4rW0rkynoxDJ3oznBOQ15hGR9doKzhYQY
         52yO8TwDqNP399yKcwnvtg2nmxeW4e6qdcTfwfwrdctp5cHAK5AcPPNPvxtXu1+pzAX9
         rOOXciCnU1S0KySppFyAqPZ7tFFvwvjRp0iyyjU8y9WZjRUxGKUbN7lY7D/ejCOH2saz
         xWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759473577; x=1760078377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NUJR+0x4Extu7PhnW8nn0TsoPMkUfDkUjklFIsZ2dE=;
        b=gkgwQbvyjdpOT7cBhq+Mn6ptFSaDJnEudHAiB7+z02vigjbs26JPXr3V9tdIvSUM37
         Sh29c7kxqOgZBjlWOQ99sN+XmwUtRAUOiEK/VdRNYVvRJiocLne02Q0vc9pe7/bvdFwS
         tmuSCZHe+0VQVqLpthGf/al1S0ziq/e5wNSKIUdoa8IzkqkdYDN1dmkOcOEOOBPMembE
         hsKVXs5Nx3KslmyqdQYvUpJ7wvg0LegHn2K4ww4w0strSmqyTEe0gSiuYf74g0dW3bJw
         8VlV4wa9tDHjJbn71+hHG06jk4Z/ZpgrCCZi+hy0SlcEkP1pWlslNA5/YS8Gg565BJs/
         h3Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXZgitwXlgdydV+aYcCxvVvrYWbIo2cFQKnJAj2WuJhjoh4XtH+RylB1mP9iHku920ptyKsA1jm46U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4VHMeBYSGo/5vsoV+zh/KRHByT1Mq8q6qhd7C6I2jpRUhfMqJ
	Nz3Af6jsjOjj1DtMvO96Obg0ijKEJPI6wqWx2NEIYX8y5YrH1faG4VPhDUW0Ys8hGw==
X-Gm-Gg: ASbGncvfQbvSZhGmSFU8P8am6/xEx0tcdr+iQlDiVPp7Kdk9xKlK1c8zlhlQsqN8Gg1
	7P60lxnIF0/QCzMvfd5VBTuZqpDAyE5aKyuJKN8Qt62mA1uLxjJPzawkML5tg2q2s5qnWskna8E
	poH01+p6SgqHOYvZYBbtu42bcY44lU9qCrmrKWIGSoLSTXUU44ohq2Q1gbStzIZKStoedGoASvb
	GviEhUj62dvOxicdY5gNFpe/8gBezsAZKEansdzO7UxrAW9Pv4XcdobDugRzlxBRdXs9e7Y8eXs
	FpCtUSygM9LkFJsRgW7nEI9ijj2Z0nGuDWsRWc7R+eGQHAtgI2ssmeOEc4jaO/4FU+CYYYihPVr
	JjjPkOveSkzeSclY0Tj80NJB99sH5qFUuuILJHxTJmf0DoPZGkWCZg24MhMhjTLXV1kVNIcgwJS
	WQlkUIU3kv1AfI2A==
X-Google-Smtp-Source: AGHT+IF225ruxuMkKqMzIY2DU6axi9BegMmyzKVEb8CRf18y/aWsRDvWSU7iRPoYcjDxe3FPYwAwQQ==
X-Received: by 2002:a17:903:3c2e:b0:268:cc5:5e44 with SMTP id d9443c01a7336-28e9a558cd2mr2630335ad.6.1759473576553;
        Thu, 02 Oct 2025 23:39:36 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1ba024sm39044885ad.68.2025.10.02.23.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 23:39:35 -0700 (PDT)
Date: Thu, 2 Oct 2025 23:39:31 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org, seanjc@google.com,
	pbonzini@redhat.com, borntraeger@linux.ibm.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org,
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn,
	chenhuacai@kernel.org, oliver.upton@linux.dev,
	ajones@ventanamicro.com
Subject: Re: [PATCH v3 9/9] KVM: selftests: Provide README.rst for KVM
 selftests runner
Message-ID: <20251003063931.GA1130776.vipinsh@google.com>
References: <20250930163635.4035866-1-vipinsh@google.com>
 <20250930163635.4035866-10-vipinsh@google.com>
 <86qzvnypsp.wl-maz@kernel.org>
 <20251001173225.GA420255.vipinsh@google.com>
 <86a529z7qh.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86a529z7qh.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_233938_861602_25D6ABC2 
X-CRM114-Status: GOOD (  22.90  )
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

On 2025-10-02 15:41:26, Marc Zyngier wrote:
> On Wed, 01 Oct 2025 18:32:25 +0100,
> Vipin Sharma <vipinsh@google.com> wrote:
> > 
> > On 2025-10-01 09:44:22, Marc Zyngier wrote:
> > 
> > > > +in `default.test` files. Each KVM selftest will have a directory in  which
> > > > +`default.test` file will be created with executable path relative to KVM
> > > > +selftest root directory i.e. `/tools/testing/selftests/kvm`.
> > > 
> > > Shouldn't this honor the existing build output directives? If it
> > > actually does, then you want to call this out.
> > > 
> > 
> > To generate default test files in a specific directory one can use
> > "OUTPUT" in the make command
> 
> The standard way to do this is documented in the top level Makefile:
> 
> <quote>
> # This does not need to match to the root of the kernel source tree.
> #
> # For example, you can do this:
> #
> #  cd /dir/to/store/output/files; make -f /dir/to/kernel/source/Makefile
> #
> # If you want to save output files in a different location, there are
> # two syntaxes to specify it.
> #
> # 1) O=
> # Use "make O=dir/to/store/output/files/"
> #
> # 2) Set KBUILD_OUTPUT
> # Set the environment variable KBUILD_OUTPUT to point to the output directory.
> # export KBUILD_OUTPUT=dir/to/store/output/files/; make
> #
> # The O= assignment takes precedence over the KBUILD_OUTPUT environment
> # variable.
> </quote>
> 
> Your new infrastructure should support the existing mechanism (and
> avoid introducing a new one).
> 

Options "O" and "KBUILD_OUTPUT" are not supported by KVM makefile. I
tried running below commands in KVM selftest directory

  make O=~/some/dir
  make KBUILD_OUTPUT=~/some/dir

Both of the command generate output in the KVM selftest directory. So,
my new Makefile rule "tests_install" is behaving as per the current KVM
behavior.

However, building through kselftest Makefile do support "O" and
"KBUILD_OUTPUT". For example, if we are in kernel root directory,

  make O=~/some/dir -C tools/testing/selftests TARGETS=kvm

now output binaries will be generated in ~/some/dir. To make testcases
also be generated in the output directory below change is needed. 

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 6bb63f88c0e6..a2b5c064d3a3 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 include ../../../build/Build.include
 
-all:
+all: tests_install
 
 LIBKVM += lib/assert.c
 LIBKVM += lib/elf.c
@@ -358,4 +358,7 @@ tests_install:
        $(foreach tc, $(list_progs), \
                $(shell echo $(tc) > $(patsubst %,$(OUTPUT)/$(DEFAULT_TESTCASES)/%/default.test,$(tc))))
 
+       @if [ ! -d $(OUTPUT)/runner ]; then             \
+               cp -r $(selfdir)/kvm/runner $(OUTPUT);  \
+       fi
        @:

Since testcases by themselves will not be useful, I have updated the
rule in the above diff to copy runner code as well to the output directory.

I think this brings my changes to honor existing build output
directives. Let me know if this needs some fixes.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
