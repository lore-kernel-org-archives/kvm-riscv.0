Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F234BCA1015
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 02:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kutvp3eXRtk90WHDVwMo+oTYfkdo+ijEnXZ5VMJm9Qk=; b=Q1+1VMX1D+B3tA
	PiAuWELhu7SZtblsSSQ8hRBw9+neujW+eqdhAQOt3VKD9T841b7DlCFVONcqli3DecCtrPyYiH9g2
	auwnqk5GI61ia4jUkGF4b/qlNRlW8xbT0CaUKEBeQM/26P3ANl0Pfv3K4K+YlqG/x2yLK9wqv5yQR
	2iDHR7Xjecj0HGuyODnvyWVWDL45O+xg0utNhu5ba7dU/2bwmTOhEv+9dTP28/E7vnjP+38/gJNm2
	4oDkVpSbb0BgDUigpVHsziqWnJS32TOrvp66Dpr+hGzA1bkTGOrErRlnn587Uc+ddKDjvMEw/bFff
	JxltHVQ+aiZI7B3DHXlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzRh-00000008GdE-1Pi4;
	Thu, 04 Sep 2025 02:11:29 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwtb-00000007ubr-2Non
	for kvm-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 23:28:09 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-71d5fb5e34cso4786177b3.0
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Sep 2025 16:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1756942086; x=1757546886; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qMfa0Po6AON5gKDR6IPWYqovOd/cI9bxk3AYRRhlrHs=;
        b=lAwglz5PNykmKaLSv9r7KX22udm8myuy916aDFUP6ogqIMlKKO8qg88zeqyzUqc7Mq
         1QtU2w8LAdUMjped9VYl1yfbGs3lU3/j61v3wBuK+8X4IWucTn9UcQcmGyW+JQ1AXsFD
         7u9VDmYr07WNenVb6qEO6R+FPX31cxXuxZwlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756942086; x=1757546886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMfa0Po6AON5gKDR6IPWYqovOd/cI9bxk3AYRRhlrHs=;
        b=Dfo5Ta1kU1U/t1g9dw2wRM9EhEEVQmi8epuRsyq1cfTFXSCH/GVbjg/3qgvtOT2GsB
         AidXHIYOTeUbTJ1LNVAljW6ujont0TQeaua7w9x2pPYlaEKCxlMgzmfs2mQw6znAGOA0
         Yyi26c1pi1BevmgQcxymsrmoL8YjRshbc3rMnWowcry1mTEkOygdGnYmKdcPgYX8+xTa
         B8JYZSfmfJA6ofsvZC6tjNYYe7RYLY/4q1vv2q0nNVWm3EahTdjwSor2pKvdaH8jziZN
         u2PtLxzYEjrqVH2LAqPu/kgAw0s6/i28/NaWvHL9iBs1w1CO7ZZ6lf0rJPSk+UFeyiuV
         JgbA==
X-Gm-Message-State: AOJu0YxbFkmYeE1+gXEdemcZp2yFjuSmrVVjNXQm51jN8zFRn4dE2/Rx
	Wbj8EKS0hLjs/pO5Ln2liSXW3McYVi96oXIZaouWekqlKSSBSrbsBrATkQ5erJhww7h3NH6GUbd
	3Oc88SGZf2ZkZQk8Dw9sul4aOwFG8/z4SW7sU
X-Gm-Gg: ASbGncvYdX78M+YWq8xvTC477vOTulwjDYHWM/3EXiuLc0MlSsAlb28LSmbCiogDggl
	i7+ddPSXcmFltc4s4GLDYh/QRpdwdxBR8RPLvOILlZj+o75Q5400rtd1f4ebbXdDbek8Cn2ybX0
	iPXHRopitxVLwIdtlLi+3+XLQ1Ipd1pYzdbelpZP9akugiZuT7c0jdgNsfe5kBXa3u/haziWDiF
	42opkrWCTje303KMXilOUcMkJIH
X-Google-Smtp-Source: AGHT+IH7FznMSuqEQ2w53VR/rPJV67jGSBAu0+n6G5x02tRwmPlsb58/aw/SdRFJTb2blOuXAEnNZ3frBVjX7pavExM=
X-Received: by 2002:a05:690c:56c7:b0:723:98d5:7a62 with SMTP id
 00721157ae682-72398d580ebmr117553917b3.3.1756942086010; Wed, 03 Sep 2025
 16:28:06 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Sep 2025 08:57:54 +0930
X-Gm-Features: Ac12FXyBWvVQJdjUNlsar2kSzZYXaU1pqyCoAGwB_58XykOmtj1mldKZW998MQE
Message-ID: <CACPK8XddfiKcS_-pYwG5b7i8pwh7ea-QDA=fwZgkP245Ad9ECQ@mail.gmail.com>
Subject: [kvm-unit-tests] riscv build failure
To: kvm-riscv@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>, Buildroot Mailing List <buildroot@buildroot.org>, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_162807_974224_6B95AB5A 
X-CRM114-Status: UNSURE (   9.11  )
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

I'm building kvm-unit-tests as part of buildroot and hitting a build
failure. It looks like there's a missing dependency on
riscv/sbi-asm.S, as building that manually fixes the issue. Triggering
buildroot again (several times) doesn't resolve the issue so it
doesn't look like a race condition.

I can't reproduce with a normal cross compile on my machine. Buildroot
uses make -C, in case that makes a difference.

The build steps look like this:

bzcat /localdev/jms/buildroot/dl/kvm-unit-tests/kvm-unit-tests-v2025-06-05.tar.bz2
| /localdev/jms/buildroot/output-riscv-rvv/host/bin/tar
--strip-components=1 -C
/localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
  -xf -
cd /localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
&& ./configure --disable-werror --arch="riscv64" --processor=""
--endian="little"
--cross-prefix="/localdev/jms/buildroot/output-riscv-rvv/host/bin/riscv64-buildroot-linux-gnu-"
GIT_DIR=. PATH="/localdev/jms/buildroot/output-riscv-rvv/host/bin:/localdev/jms/buildroot/output-riscv-rvv/host/sbin:/home/jms/.local/bin:/home/jms/bin:/home/jms/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
/usr/bin/make -j385  -C
/localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
standalone

The failing line, with the full paths trimmed for readability:

riscv64-buildroot-linux-gnu-ld -melf64lriscv -nostdlib  -no-pie -z
noexecstack -pie -n -z notext -o riscv/sbi.elf -T riscv/flat.lds \
    riscv/sbi.o riscv/cstart.o riscv/sbi.aux.o lib/libcflat.a
lib/libfdt/libfdt.a
riscv64-buildroot-linux-gnu-ld: riscv/sbi.o: in function `cpumask_test_cpu':
lib/cpumask.h:35:(.text+0xd8a): undefined reference to
`sbi_hsm_check_non_retentive_suspend'
riscv64-buildroot-linux-gnu-ld: riscv/sbi.o: in function
`hart_suspend_and_wait_ipi':
riscv/sbi.c:591:(.text+0xde2): undefined reference to
`sbi_hsm_check_non_retentive_suspend'
riscv64-buildroot-linux-gnu-ld: riscv/sbi.o: in function `cpumask_test_cpu':
lib/cpumask.h:36:(.text+0x1064): undefined reference to `sbi_susp_resume'
/riscv64-buildroot-linux-gnu-ld: riscv/sbi.o: in function `susp_one_prep':
riscv/sbi.c:1434:(.text+0x1796): undefined reference to
`sbi_hsm_check_hart_start'
riscv64-buildroot-linux-gnu-ld: riscv/sbi.o: in function `check_dbcn':
/riscv/sbi.c:1247:(.text.startup+0x9fe): undefined reference to `check_sse'
riscv64-buildroot-linux-gnu-ld:
/localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05/riscv/sbi.c:1247:(.text.startup+0xa02):
undefined reference to `check_fwft'
make[2]: *** [riscv/Makefile:131: riscv/sbi.elf] Error 1

The full build log is at
https://ozlabs.org/~joel/tmp/buildroot-kvm-unit-tests-build-log.txt

I was able to reproduce with the 2025-07-31 tag, which is the same as
today's master branch.

Cheers,

Joel

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
