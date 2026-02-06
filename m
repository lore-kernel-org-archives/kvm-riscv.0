Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7D4ECD9B7
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5vH/mw1QsiDfYh9Cig4BhkL6Ja5P3YKj50uVtdAIi7I=; b=K2SB54HT9gqVeW
	Ko8PZ/RvpjXhkA3x66DHG1sPQcWcqz61FeaSJAiHxm+cBrjOk5gOMPJG2KB6C3uIY6GVsu9UJ+Eg/
	TgYcFYH2Bx7nKrZTBgq5yinkb+90rORPVctDTtCywIav/hFsx3Vbcg4f/KxGCkOwJ3GY0M79pX2Jn
	KdzjSko2B+9eKgz+2uHXxV8OlRAXb5DVFFiVWajbomk/rDIlZ0/AXILVUG03qrKLCGPPsWIv4Os9o
	cbxrOtcoHZQN5yJZhWnnoGd1NdAdlShpABf5Qcc5z0WlOWTKAsOuFz4o4VUJSrRylk/afIUY2BPU+
	jXmS+dUM8UDjDWOEKb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dq-0000000Ae7P-2hmm;
	Fri, 06 Feb 2026 00:24:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dn-0000000Adzs-09xm
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:08 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615JZCMr3077415
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EC8ltA+v3Xo
	ICkCO8yCorlYHScSXDLet/dXbz3KfPq0=; b=cJRSmg38JMOuMdntpO0GmYUfe3N
	vbKbNGdtb3YYMsf+NOyxBUxolsBt6SxjvkG/96Ll5THqwyMHNvLHcLqTPHnA1Vip
	ySPVKSra82PlaBZ2j5LcdfEuvLy/7URed6mY2eI+6N9dXo4ykr3OD9coEPECyLbv
	10fshGtW67v51yCXrPS6zPp4PC8eE0F+6eFOkgFRQ646FdpuTW1+zLQoxKUORBzx
	TAKpREQy4XGu6AbCrIftWpOwDc77r7rUKtXwzyBdW/DTRPsdO8+X8l2VUb0LRFo+
	n+O1ikY05wWRsJTwYN6HtanS0DjcARZ4e7V+rnCWH3qbMNWNKgmPVridNGQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0t2dq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:24:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b72b6fc371so7657712eec.0
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337445; x=1770942245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EC8ltA+v3XoICkCO8yCorlYHScSXDLet/dXbz3KfPq0=;
        b=Th+qIHh/rf+7CQCDOAu6QrsB59fs/lZOJWwBbRZYUs6iPBYv/MYvoqB5VzYEeW25Ft
         xsYOoK5OJQ4oJJS1P92aPxi9X2b0J4aDeZ57Nnp7HEz6LH8DIB9lvbwsK4XBe6w7D4Iw
         Bx1tbpLliCzuBrOgA90xG3ioMjWaRsQ22svv1TAOmEDsxfBscl8FTPv2PvzACJL0N/MZ
         B/MMN8+BSjk/pfXIxpE/5SfptfLGiuQf4VASVeI/fNaMpJj8ZguGyFAE8HEPOgfk5+Yb
         gxdPhoXoKCA/aqucx495YK8tGCM2+P+pCU3okbpwl9Sk9XvIXfxh1fan6e6lqXjYX+OQ
         8YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337445; x=1770942245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EC8ltA+v3XoICkCO8yCorlYHScSXDLet/dXbz3KfPq0=;
        b=cp4nL5s51P66Vnil2WIolpThh1i3kWpkNvvqMVFkFNdBfv+Osw9ub5nY8d+fpuT3/h
         ABbStEnBGZjWWVA+IsrrVL7t0nUbkvW1pFuWs3c9lRC/n0vRA+nGPuMkvf8m1pbeb6gf
         D+OXgdUh56doRFSNviqoJzLoS0759DNnhYukD44ErCERrcOWRKVpFrmZJ66ll47IOFMN
         YWLRMMbGCgLh1kAquW1Qu/F+tZUHOprB8ZFHrNZ+OkWD1UDsSoaSPY9as8iQq+vJI5uB
         Li/oipx6/fCPL+g6Jl7qFH+6Yd2BaVr+ya4iZm7eXczUPWgX6hkGOxjv88puXj8lpTHx
         xKeg==
X-Forwarded-Encrypted: i=1; AJvYcCWD4mGkAIct9y0lZPNqZY2YIMaP2oxJ2QGZjEOZj1vrAK7BAkdV40FXvjZrg7DCDyHVbUZqw3WcwtU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkDBNBlwhJHRoZnxtTJLhcharR/Bfn0TQbD4GSyZQDqm5XVM/d
	BzdANmko5J4jP6HMxYyRLGy3SFaG2tp/ULz7tJN1yO/1VUvTo5TST8uEM9Rg7RNHN4g16S7RtO2
	2Jrvr9IJk4dBKqXqHDAAzg6QtFQJl7OPcO3w3H4vBbICdYy8QC43yElerXwKuhe00WLqg
X-Gm-Gg: AZuq6aIA+JyXr1kb4qVnSsTaF4Mfw+QnVjriuVd3E6r+PcoiM6O++llbFPyO81aw62J
	IkR3k848qFp74SShYGJaogTfLZxLzEwtJ787T4wxgpZjEErNxqhwwsSvlEDqCHzovPis6dxgrAE
	nT5gIDPZVlw1qvtIx24vWeqjAiFpGC6LdP4saigCREjYOGZufTqWskGBLGNt1IIMiLJVGzb8Kiv
	sxdWS81bRWDjCX6qEzYz+OwCAqKBEBTbpzMKPA8ulrBVPyUhyE/QaO5SfXn8JtoiZt0eFvCfa+d
	/nW9EgKWAV7j/eMUFHeueOMTdGKEqII6ao7AvZVN7HyzfVG+R5jg51DQDYqnJrpEB7VBifUZjt+
	gdhCNDc3+0m6zEl3Uk5c=
X-Received: by 2002:a05:693c:3105:b0:2b7:20b:50b4 with SMTP id 5a478bee46e88-2b8564995aamr446340eec.19.1770337445041;
        Thu, 05 Feb 2026 16:24:05 -0800 (PST)
X-Received: by 2002:a05:693c:3105:b0:2b7:20b:50b4 with SMTP id 5a478bee46e88-2b8564995aamr446319eec.19.1770337444543;
        Thu, 05 Feb 2026 16:24:04 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c7f5fcsm588702eec.29.2026.02.05.16.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:24:04 -0800 (PST)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guodong Xu <guodong@riscstar.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH v1 07/11] riscv: Export have_user_pmlen* booleans
Date: Thu,  5 Feb 2026 18:23:45 -0600
Message-ID: <20260206002349.96740-8-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=WZMBqkhX c=1 sm=1 tr=0 ts=698534a5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Z9wp2c3QuIO3T_A-oVcA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: R1qSL4w73oJ1K7kDti3jlhg8yxUeQXSB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfX8Tg6qEUPjg/F
 2tbRWRms2JwqgX6IyZ/c/7dnHMKQccaenH9JxstCsTxznSVWHxnkb/hfA6UUJRqcyFB9lRN6vIR
 VnQRd/4zPszZWtCXlj2RUyZ9FztqQV+ET4LXWrbs4gmQQbIoGg3pkDneDU94KMJA4oQUSwng0I3
 i8Eybi2MmfG9GPtTaGaS2FjJY0B/y2NjmLZb3V8sLuDKthU3w7RZ2mU/eV8lheES51lWztxjtGD
 LKNDAu8rz4n8BpycNl8ygvayjBng55b+lvmmF6LQD2lbU8BNUJi9F93K5daF6ySXf4K+R0J0Fhu
 50a3AnOuB5KzFHQqCNKP8YmwRZ6ICD0hXgkEa2oNamEsxcTXzY9lVSdSmdKliI3qRJllIx8ZjQ0
 7Z3nZQ4i/B6k81vLKbvFpYD79GXGYQEEZZjV97vda8QnkRR8rwrkFyyFJzeXEPqczcPqELedI2g
 qvxX6EwhsDVPlduslog==
X-Proofpoint-ORIG-GUID: R1qSL4w73oJ1K7kDti3jlhg8yxUeQXSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162407_200059_41DFA391 
X-CRM114-Status: GOOD (  15.21  )
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

A following patch will need to access have_user_pmlen_7 from
another file.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/kernel/process.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 31a392993cb4..4fa14aff7f8d 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -274,8 +274,8 @@ enum {
 	PMLEN_16 = 16,
 };
 
-static bool have_user_pmlen_7;
-static bool have_user_pmlen_16;
+bool riscv_have_user_pmlen_7;
+bool riscv_have_user_pmlen_16;
 
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
@@ -306,10 +306,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
 	pmlen = FIELD_GET(PR_PMLEN_MASK, arg);
 	if (pmlen == PMLEN_0) {
 		pmm = ENVCFG_PMM_PMLEN_0;
-	} else if (pmlen <= PMLEN_7 && have_user_pmlen_7) {
+	} else if (pmlen <= PMLEN_7 && riscv_have_user_pmlen_7) {
 		pmlen = PMLEN_7;
 		pmm = ENVCFG_PMM_PMLEN_7;
-	} else if (pmlen <= PMLEN_16 && have_user_pmlen_16) {
+	} else if (pmlen <= PMLEN_16 && riscv_have_user_pmlen_16) {
 		pmlen = PMLEN_16;
 		pmm = ENVCFG_PMM_PMLEN_16;
 	} else {
@@ -407,8 +407,8 @@ static int __init tagged_addr_init(void)
 	 * Assume the supported PMLEN values are the same on all harts.
 	 */
 	csr_clear(CSR_ENVCFG, ENVCFG_PMM);
-	have_user_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
-	have_user_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
+	riscv_have_user_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
+	riscv_have_user_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
 
 	if (!register_sysctl("abi", tagged_addr_sysctl_table))
 		return -EINVAL;
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
