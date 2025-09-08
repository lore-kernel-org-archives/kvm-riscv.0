Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20A5CA101F
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 01:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhT+3jZhbfzzXr6L3j4X4QsCAONLQTFdoTAVk1ON1KA=; b=tHPO1LyYXyfLXN
	ABxONXU1oODaTqIJBujcFkmceT23vWGotaLpLd+D/Nx1S6TUSa4J/ypt7nXh7dNP7QgkfLp7IHtvA
	/iC5gJod6htNO2F7R9nyIk6xvNjqR4dQEY7zAXmIo9qMRw4NaJ+qloRbYHNb1AN5+TvVRjnO3Zz3p
	I3CQbDBeb8VpQo7eafBtdOiGXREBbDkwlcmjmhRMa6xUXJXdlFA/fVRpQ5JwjMOAlta/T1BdIodcF
	qJmQEmxinu29Kux36CrpxsxqRMTmjmvUXoHXG91F4wzb9y1MmxWGrmEt4AktAWFGi7Nl6Yf1J1qbJ
	WqIYpqtk6HV1WfaVfxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvQLC-0000000DgnA-2J2w;
	Mon, 08 Sep 2025 01:06:42 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvQLA-0000000Dglc-12Pz
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 01:06:41 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-772301f8ae2so3197463b3a.0
        for <kvm-riscv@lists.infradead.org>; Sun, 07 Sep 2025 18:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757293599; x=1757898399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQT9eTMrRmn+OzlzVaTflxL78oSBXuG2K1qxi9R+p9s=;
        b=EM1ywfMNxx4ftLwUNGM+NeH0Pay1Waj5ko9a3F1XqqIj0FIuIU7Ja846oyjUuFYSFq
         ah8pQU7PM+PEz4p4mNrpe3uAv7jE6pg75xmOE4obKiv3tnKvYuFn4dvgvZ4YNnmcI3ee
         zvMZGIP5OgRfOA+tr6kegDmdxyc+/cROSkyg1fDCvGQK3qhoVhZnGmVMT98RI6IMY5iT
         tdgk5O8qdhT4S2RKFWpaOVGYL29HahFswHC/DpR5UaoYhdD8pZv0U1NsEYf/t/L4FvvE
         OxalOP/38RXt1FFlU0Ld8j19RuxGAEcuVgelH0eAK5G+KOguHuNZ+MkQJZxQB3mmfWdm
         DOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757293599; x=1757898399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQT9eTMrRmn+OzlzVaTflxL78oSBXuG2K1qxi9R+p9s=;
        b=pSMl1l8XUFi3U7+W/EcN2+PtJjkqCQUuzZKaDuXiGp2u/5p63wojpKENAke5t3W5Z9
         FmRJbUGAu+olkQicLF6mYht03aoylG53VItNhY4n5TigabSxyeOBzqqUykSxU2lMbBDN
         Sb9NW18TgMPZB1MEo0eQaHlw+GJqDUVqSLxc30MLBx7RZhUTYHp+U6Dhgxy78hk93w+N
         rC7NbqW1N3VzncsCnF1fTNKMqayoGZ0I7XLT9achmaQTPmlyn1UidRzcuhhU0ABk1Cpx
         IBVKlzUVYXMhtNDvErlCA9kyU+ytf+dwy4QD+JQMTCxVy2Y/fG3FFbRtEMP2TjubyP4V
         +Lzg==
X-Forwarded-Encrypted: i=1; AJvYcCV1TWrh5IOV+v18pUkovmKHVCjTLxxNT4nzRnDbvehjQFP4VazC0mfKAGBc8/hW32PHg5pN2s3fC5E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZty42Baz38K49zFBtx+85PunI8wjt6hcEy0tUn4vs2ceqBrzG
	UJX4D241AQoYVemQ/7OSAaUfopWKDfrcldzidrBhQge3cS/v0QQPn7Y9
X-Gm-Gg: ASbGnctbMerJ9pUuW+EImGdErcRphSXovtQLF5V7hJolzTtgcf5mhiIpNiwdG6cA5En
	tH7a9wESHYYCEG+neK+HiE9LC1+zunMC1ZTAVCUQ+B4UA00YzgCi6L8CRr3J2lBAjq4Bc7rPLoI
	xQNyB5no679aVLkIDjn4teoUnXKSZ68rShipTogymKl0VMblr+1b2s4SiRJVkEjVEcWPHKmHgKt
	NcFbXXxaAnci29SYfnIjgOrM0u8h9dJkMxpU6DVGbQIOhHc7JrppEd4XYv07FQvUDZBoruyWDwf
	JyhK+FE/2bXdAjcRSxT3ctJdm8plum8ZfzjqyCAe0POKwwku7cfoHxQDc9ebJr3NOsbS/uV4AD1
	kIAXx6aXlOxKWEmSefeDzrWbi715CT0anIVLgty/1XBL3orHVsUSOWeSRTZgJfX0OSCmy
X-Google-Smtp-Source: AGHT+IEUmS3BrXw9i7Cn3ipiZgjhoU6JUViEvHDPyCzTOvtgmINnuNl/Vf8OEDtpBL4D4AVqZ74cXg==
X-Received: by 2002:a05:6a20:a11d:b0:24e:84c9:e9b0 with SMTP id adf61e73a8af0-2533f7cc30fmr7913988637.17.1757293599375;
        Sun, 07 Sep 2025 18:06:39 -0700 (PDT)
Received: from lima-default (123.253.189.97.qld.leaptel.network. [123.253.189.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25125d76218sm49507775ad.119.2025.09.07.18.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 18:06:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Shaoqin Huang <shahuang@redhat.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	kvm-riscv@lists.infradead.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 2/2] shellcheck: suppress SC2327,2328 false positives
Date: Mon,  8 Sep 2025 11:06:18 +1000
Message-ID: <20250908010618.440178-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908010618.440178-1-npiggin@gmail.com>
References: <20250908010618.440178-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_180640_350190_DBAD074C 
X-CRM114-Status: GOOD (  11.43  )
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

Shellcheck warnings SC2327,SC2328 complain that a command substitution
will be empty if the output is redirected, which is a valid warning but
shellcheck is not smart enough to see when output is redirected into a
command that outputs what the command substitution wanted.

Add comments and shellcheck directives to these cases.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 9 +++++++++
 scripts/runtime.bash  | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 58e4f93f..9c089f88 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -9,6 +9,11 @@ run_test ()
 
 	# stdout to {stdout}, stderr to $errors and stderr
 	exec {stdout}>&1
+	# SC complains that redirection without tee takes output way from
+	# command substitution, but that is what we want here (stderr output
+	# does go to command substitution because tee is used, but stdout does
+	# not).
+	# shellcheck disable=SC2327,SC2328
 	errors=$("${@}" $INITRD </dev/null 2> >(tee /dev/stderr) > /dev/fd/$stdout)
 	ret=$?
 	exec {stdout}>&-
@@ -23,6 +28,10 @@ run_test_status ()
 	local stdout ret
 
 	exec {stdout}>&1
+	# SC complains that redirection without tee takes output way from
+	# command substitution, but that is what we want here (tee is used
+	# inside the parenthesis).
+	# shellcheck disable=SC2327,SC2328
 	lines=$(run_test "$@" > >(tee /dev/fd/$stdout))
 	ret=$?
 	exec {stdout}>&-
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 289e52bb..12ac0f38 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -190,6 +190,12 @@ function run()
     # qemu_params/extra_params in the config file may contain backticks that
     # need to be expanded, so use eval to start qemu.  Use "> >(foo)" instead of
     # a pipe to preserve the exit status.
+    #
+    # SC complains that redirection without tee takes output way from command
+    # substitution, but that is what we want here (tee is used inside the
+    # parenthesis and output piped to extract_summary which is captured by
+    # command substitution).
+    # shellcheck disable=SC2327,SC2328
     summary=$(eval "$cmdline" 2> >(RUNTIME_log_stderr $testname) \
                              > >(tee >(RUNTIME_log_stdout $testname $kernel) | extract_summary))
     ret=$?
-- 
2.51.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
