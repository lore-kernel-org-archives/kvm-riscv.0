Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCECCD37BE
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 May 2026 13:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TExPhNxo3tsdO353Q7to1VIbXgNoumRTyQSW597B80=; b=yWKtSfuXGTr4tU
	wAfpUuBcCq0OIXE5siWFtykxu3KsH7+qJd/QhAnU4vyR+Ub+6Ra5+T7y5u1ZhHFwfwFdNZ+8Xg0LH
	XEEUgpYgNvClL2PqN55PavrBhgAei2SaPzby0eNEBu0KEkn54R90oTHzFc4wk3LEsVNPz9WdP0xOH
	SaUmDREl0RYQrwo4tvWweMVv1/hRB0en64bztKJZYseSWagrNj7846mhioasR5N8YGSLHt2Wf25Ty
	3o8S9/bGgPxYoJY1YADE/ZYG7KMErK6fR6ewT2Wq7uY+7mz4Xb+KeRm5rUfDBrxYCATw560/xEJFF
	vsfaqEzALNJqTIV9aHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQoD-0000000Dle3-45EQ;
	Mon, 11 May 2026 13:36:34 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQoA-0000000DlcP-45zj
	for kvm-riscv@lists.infradead.org;
	Mon, 11 May 2026 13:36:32 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-362e50b4641so2458358a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 11 May 2026 06:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506590; x=1779111390; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOFE3ehNiNk6algJYrLucEv0fxL7pkMWqS8jdXvY7Mk=;
        b=rpZUQyIO+wb2o3iT4msGE++ieeSN8lqR6zwgmut8JIn3Rzvc6ABrnBY/jlyS7u/ufN
         ZeWjo5wDOdHs6xAzuG25ayPaJI2n80Rg2GkHc5EV0/vTWCPmf9iRuAP3sjb1ujkqr5Yi
         zoWMPmXlBUsjTyRa+bO6hNCNKkIY8YfO8UUDcagWTL9bE0PWESRUk/EqiXEpLMFYlV28
         LJJfcHPO24RFJNEUyp3Hugn14KqEnKl8cXrcqZ11ZszkMDPWkwVPkS/Guf8rbcC2/YVP
         y5rLAZpXxbzDiTMB4QHH61ge07Apq4VFZkXjGJNxnkzh0WQqAjTQmsniuYwA1CZmub5Z
         uPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506590; x=1779111390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EOFE3ehNiNk6algJYrLucEv0fxL7pkMWqS8jdXvY7Mk=;
        b=KS9nw5ZWOhs3G9puvpAe0iowirAHDG6cVXR7A1TXwQugYDMaQLgNQ1Fw/Os9QnokXD
         X7b4OsZihjNc5Cy0vy41Yk0b4sgjGJPHVePyIVNGxAS5AnmDhfFDMWTLF0DzUaT3Un8w
         1N2LizmyUn2FxGLUiQJb/qkU+1pYKUf/rz1523bswWONUupmTYBnn6MYLXYDRI41E+Fl
         u8VWxx7RptfqbQC8VzeKxWcFeP4LL02l4gb1kejXHSQAkAgeaZccFhGYeoC8cf8eLcDl
         lFu5LB0gspQ0pVnFzgWFJbnsYYdAg5XTKihYIh6bp4OLgNDbD3Cx7arO218HyiwjMgnf
         wpkw==
X-Forwarded-Encrypted: i=1; AFNElJ8jSWVisa6pmywM15MvMfh41Qa1lKm+DWK55sjvvu4QL665LUwMPnrRqyF5H06Z8q643ZxQukZd800=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjMrGscTtmDq8KoeXF2D08At1f1hSZldH83l2Drybqze+Zavui
	wf5FG3lb5sbrVlm4O5W9ZTM7GQNBilr0SYnZ2QyfB9D0Y0lsOZXpTZsEnXV1Qn9RrRE=
X-Gm-Gg: Acq92OH0Cb0M4YR0R+NiIO1YV2KI5A/GKrjn/8lffbi/kdv7kk96CZsqeCDxHPwPgDL
	Kq9K9W7vR8j/+Mjq6riiV5esIbvRmzmwfk84vdDL8I06FtA6BgM924t/rR9LTK0IQ8lQAnzRfjz
	dEOM5wtU1hhS34ybAYfXmYh4qjyC9h2yF3nhtxY3Q7fTCeKlXrWxKDJ5Q12yec9OL/1gZNBkvjH
	9ZQybUPGeadF/lTF9JxBVyGc9XlT4BvKl+x7BwPiH84EQoLfCKLGQpNaPAvswobPJ18CiNM408+
	xrOqxlCnytygr1/Zq0ply03QCC3AXPI0bD9Rp5nxcF38w81fNpzfJsycyVtBD2wjLWSCkSFPodL
	9Z1yCV1+TmMesLqEZsD784w2iQpwAMNn3BjCHkucqwK41S7N92BF63gpzZJPjKi2QOPOB7jbIn2
	E7wxOpA36FCzm4GvrSIJprn+fAfDC4moVDF159E91ZvFY=
X-Received: by 2002:a17:90b:38c2:b0:362:e7e5:a20a with SMTP id 98e67ed59e1d1-367d46c6798mr10065289a91.4.1778506590008;
        Mon, 11 May 2026 06:36:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:36:29 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:46 -0400
Subject: [PATCH v2 01/10] riscv: hwprobe.rst: Document EXT_ZICFISS
MIME-Version: 1.0
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-1-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_063631_031287_5EB9B52C 
X-CRM114-Status: UNSURE (   8.29  )
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

Commit 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss
enumeration in hwprobe") added RISCV_HWPROBE_EXT_ZICFISS as bit 0 of
RISCV_HWPROBE_KEY_IMA_EXT_1 but did not add a matching entry to
Documentation/arch/riscv/hwprobe.rst.  Add it now.

Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe")
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch.
---
 Documentation/arch/riscv/hwprobe.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c420a8349bc68..b1a84ac06da75 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -391,3 +391,7 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
+       as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+       extensions specification, ratified 2024-07.

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
