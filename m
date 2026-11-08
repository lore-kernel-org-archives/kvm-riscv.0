Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803EF606A321
	for <kvm-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 09:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wf/IwMMB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lv4FsRl6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVtAt0re
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vmGrY274z1yU0w8GYMUpsg0L12ZMLST9fDeexJJI0gU=; b=Wf/IwMMBgEl6Sd9Yy6Y9I+kJMs
	J6+Kk/JM/IcsnS+/kKhMgmdoJ64e/8UGUFOSOog1XlbPaZIDDT+W1PmrS3Oq/zap4oH/mNh+/ZFod
	hZQCv7cJFpct8QQ6Xo3iXvapQ/lh+Z+227tqKH8N/d26V0E6gpD8mILYO4SvFVDoYkEV6WWvgn8OS
	xHPI9x1h61GVS8yXtQXDuxNnBRxVA8dwDsxXzpU1M5TWfQwg6UzRig0QhIa7vHzDQaWov8PWA86kr
	QAk+Ki9Vo5wrHQZKFP6gReYkmw8IkIT7rN7H2UE2aifJTYnQa3Vk29aDdV5YOSNFGBFQmZAuRNVNS
	nvBYuTSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzPp-0000000FvM1-3hVV;
	Sun, 08 Nov 2026 09:42:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzPm-0000000FvLF-40GG
	for kvm-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 09:42:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A87fZJg1922127
	for <kvm-riscv@lists.infradead.org>; Sun, 8 Nov 2026 09:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3JMAeNplX11HP8M7OpoZXw
	AtKWg3fKqmyi8RRJKR7Ns=; b=lv4FsRl6WqhX0fKESJFByQaCUzZAh5CleLcSpR
	yR20lSJyJX0FcCn1R9MiLTBSA/9Jy0BDGVQi2hWGE+3mbayfAEtrb8Ok40AH0bdc
	1vbJVManIJCLl3ZfXIvs+AhzaI65YV4htXx2XaC3AplIxzHTJn7U+X7HdE/taSmQ
	xlUgHg8DhORNn/aJYQPHZgYkUKpNArXcS4070L3qBJWpyUUCO1kjDuKkLFExf+BX
	mNtPWOYXb3S/ydMnY6DYI5N9k/KpvW+1fgUlwUG9U4kVIl40xmxskAxo3d+1prJ0
	o5Rxs97cfqKqmukGLGWxtUTThNX5rbtOJ7e9IfXrsGU5FeDw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsatnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Sun, 08 Nov 2026 09:42:18 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b346e49674so989587b3.0
        for <kvm-riscv@lists.infradead.org>; Sun, 08 Nov 2026 01:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794130937; x=1794735737; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3JMAeNplX11HP8M7OpoZXwAtKWg3fKqmyi8RRJKR7Ns=;
        b=bVtAt0reYGd0vlMJLLsSLxMIOCm70fKhjxOM2bS8Xdgv3pNiCOM8sSX8qVu2pGCYjn
         IxoyYg4nN8W/SDct1irgJCmc3BRmKeQ3ik93uWjSocSHcuKWWhp7WhAJlbm10Ou2C+z9
         I9MxX+rZBfxkTv5Mez2lnmdhzupTHYz+2fKI/CP3yniQpm48AB30Ru7tByWf+wOoKx5T
         J8HjSfE6ieKt0y/+KEsSDJwdSrrjyxhZb5wSVdhC1unoadU10NnQt7MMWD42pliijWx9
         cTtQsHHga4K+K6Kr8dqDCW24VN6Jn9rGTr5vq3lCtPj862F7y3JVdprBVGNBFkVQDG0Z
         0yQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130937; x=1794735737;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3JMAeNplX11HP8M7OpoZXwAtKWg3fKqmyi8RRJKR7Ns=;
        b=M+ydHYnAkH+XhL+osy5BcWcpAgEvZiraOMmQM15XgXyVZH7pMYeLauLgw8bgI+kKY4
         DwN17HBEUJZOQ71W1wPdcj9p+dOtFZYvf6sMhyv0CpUK0T8LVuMWNzfzqvQVfUulWZct
         2ozIB3Z2N8qYSx2NYXQFAhbTtNr2IdiVUPRmSvW4bZIwQpiurFmC7wDUgZw6f0VnbmMx
         dlVYmaXKemN9VJSSuafm65rssf2XAFc5nYNLCcP8wT/Z28Nh/qoW+TRsua0VCQWex7nR
         VBksilaN5a1bo9b++aLI/8kmmTtY151e7Mrx3M34oLgoK5naZ2ajuOcpWNmIpvGhoxrM
         dKPQ==
X-Forwarded-Encrypted: i=1; AL+hErHqPmaawYemQ7mZfdZXCS/h4plR30sF6yWSW9HyDWEyPLtooLtKLG2XNx7HOZGmfbEnCZWqSD/oRqA=@lists.infradead.org
X-Gm-Message-State: APuU4Z/8TeAxUmfO+k3Qw3GlyKNeLPXy9KmN+I0hxArNiGA26UzIHOI9
	LHOlw9FJffo4DKFp3uDBL7+AjnjvxEoUddVRNM2VgwLV/zeJ10UVuVAYQpVSrDlJNMfky2s0oWE
	F4bW5ReelzNfqwCXvsLA5YphXXw+JGlWM571Y2V6JZA1apmaLwE27Fwp7y5vK7IPZY0Ik
X-Gm-Gg: AYBFou0SyizpBHOuhRDXNQxf1R0PwCQCTKGOXElN2zXiwEKjisW7x3lCpeELdgVUaWD
	Ng5rUWpUQ6/IF5bIRgfLlaacQyKPZV4hWnVqc733GrJG+ThGl/rGy75GpDBn5BenQ4OQ/O7REzo
	zcTxIpq2avi6bH+Q6F/530CRKN3t+dXeAxlHGo6t5KZnOszKXFN5GwnLS8JAEJVVpzSdZOHig9P
	32JNMkiB+Vqqcd2fvvoGfN8BZnsgs8j9xtk7BzpsOU42MQyRWUIAAjjbZuDyZQQZTo7MjSM3u8n
	XFjRp4JKrcufbeGNvyWoO5MRvhzTZ6OGM0ci+tHIBSBeWlpX69FTdS04M8ubP6ZJb/G86k3cNAj
	7T5hLJg7PK42Ycdfsjqb7hGpuyGcqnxFY+1yXQTlSaCtZJDslIOFKtGs/+M/xW2cJXj3vGHu1gz
	//hh2sOc3GHA==
X-Received: by 2002:a05:690c:5601:20b0:8b3:209d:f8ce with SMTP id 00721157ae682-8b356638309mr19995487b3.11.1794130937134;
        Sun, 08 Nov 2026 01:42:17 -0800 (PST)
X-Received: by 2002:a05:690c:5601:20b0:8b3:209d:f8ce with SMTP id 00721157ae682-8b356638309mr19995407b3.11.1794130936526;
        Sun, 08 Nov 2026 01:42:16 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36b63226asm11509677b3.2.2026.11.08.01.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:42:15 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 04:42:01 -0500
Subject: [PATCH] riscv: cfi: parse riscv_nousercfi before
 riscv_fill_hwcap()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-nousercfi-early-param-v1-1-ea22d3a60683@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOhD8GoC/yXMTQ6CMBBA4auQWTsJJfw0XsW4qMMUhkAhU2skh
 Ltbdfkt3jsgsgpHuBYHKL8kyhoyzKUAGl0YGKXPhqqsWmNKi2FNOSEvyE7nHTenbkGqre/6pib
 TWsjtpuzl/fve7n/H9JiYnt8ZnOcHHaHGw3kAAAA=
X-Change-ID: 20261108-nousercfi-early-param-c48f7d54c168
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Radim Krcmar <radim.krcmar@oss.qualcomm.com>,
        Conor Dooley <conor@kernel.org>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Andy Chiu <tchiu@tenstorrent.com>, Anup Patel <anup@brainfault.org>,
        kvm-riscv@lists.infradead.org,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-ORIG-GUID: pHf7E5Sbz4bGjgkwPZJCDUxzvKKmygEj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAzOCBTYWx0ZWRfX0AZYCBgSzPOq
 N0p9R5OGw4pkadMSEsv8LajFyVeQ5aLcR+nGujeIvo2tVfuVVFW7HfS1EGCg6H8yG+OdDNbHrBV
 aUcuZltAquUT04pACAI/svP2OecdgMM=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af043fa cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=aMo5A786GrU2q0vqzhgA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAzOCBTYWx0ZWRfXxDC50EerxnMQ
 x8jXBzG+ycefcOD79LKoMh4wnO8kfNcY/jiQtMP1t+pbtayjdLJLzoGKqPIW+wnIKWI5nP9NlCx
 IGds1JkSfyy1uAcClFWcQ6L1VrHtM+1lsLPyOKxRDoptm2Hyg49IiviLk4pAoiHZSX78VDOwX/f
 AbuBxZYrvBJQHAL4aqiRv8eR8DvLMRRzCMusqbwTvxHtLVfzeGVUv+z3iMfZMIvR/JYP35gsy4U
 LYx5IN4sHrdRzbhJbdTAXqU+6iy0p1n6Ide+EM9NvEvLg6ci2Hkp85OUi5ga0qE90xRf7lL9Kaf
 iNZnXEw0zy3Yuu6y6W4AXQel8n3Oq9BppHxkYpGcfWkUjx+h437ZSHqBdQOUqftm8MaDgJpefca
 QiKbp4Q/E1K0UwivbGR6osof4k0Et1SWgxQ0Ik7CMmZj4WlS8VKWwtLp8QgxE9pHj92786UVhH1
 eNk5vhKwDXSCxlNK6WA==
X-Proofpoint-GUID: pHf7E5Sbz4bGjgkwPZJCDUxzvKKmygEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_014219_038902_424EB561 
X-CRM114-Status: GOOD (  16.80  )
X-Spam-Score: -2.8 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ISA bitmaps don't honour riscv_nousercfi because the ISA bitmaps are
composed during setup_arch(), while riscv_nousercfi is a __setup()
parameter, and those are parsed from start_kernel() after setup_arch()
has returned.

As a consequence, the riscv_nousercfi test in riscv_cfilp_validate() and
riscv_cfiss_validate() always sees zero, and Zicfilp and Zicfiss stay in
the ISA bitmaps even when user CFI is disabled on the kernel command
line.

Register the option with early_param() instead. The handler now returns
0 on success, as early_param() expects. Also in this patch, reject a
bare "riscv_nousercfi" without a value, which early_param() passes in as
a NULL string.

Fixes: c9b859c4d8f5 ("riscv: add kernel command line option to opt out of user CFI")
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
Tested on QEMU (rva23s64 with zicfilp and zicfiss, 4 harts).

qemu-system-riscv64 -M virt -smp 4 -cpu rva23s64,zicfilp=true,zicfiss=true

Without the patch, with 'riscv_nousercfi=all', cpuinfo and hwprobe keep
reporting the disabled extensions.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/riscv/kernel/usercfi.c                     | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..b8d9db39497e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6714,7 +6714,7 @@ Kernel parameters
 			replacement properties are not found. See the Kconfig
 			entry for RISCV_ISA_FALLBACK.
 
-	riscv_nousercfi=
+	riscv_nousercfi=	[RISCV,EARLY]
 		all	Disable user CFI ABI to userspace even if cpu extension
 			are available.
 		bcfi	Disable user backward CFI ABI to userspace even if
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 86141e5bab82..a3446d706cf1 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -508,6 +508,9 @@ bool is_user_lpad_enabled(void)
 
 static int __init setup_global_riscv_enable(char *str)
 {
+	if (!str)
+		return -EINVAL;
+
 	if (strcmp(str, "all") == 0)
 		riscv_nousercfi = CMDLINE_DISABLE_RISCV_USERCFI;
 
@@ -522,7 +525,7 @@ static int __init setup_global_riscv_enable(char *str)
 			str_disabled_enabled(riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_BCFI),
 			str_disabled_enabled(riscv_nousercfi & CMDLINE_DISABLE_RISCV_USERCFI_FCFI));
 
-	return 1;
+	return 0;
 }
 
-__setup("riscv_nousercfi=", setup_global_riscv_enable);
+early_param("riscv_nousercfi", setup_global_riscv_enable);

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-nousercfi-early-param-c48f7d54c168

Best regards,
--  
Guodong Xu <guodong.xu@oss.qualcomm.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
