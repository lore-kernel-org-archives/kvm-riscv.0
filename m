Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C58D73E84
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 20:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwCJDbAKLfPE0InH/vJHR2U9a+QYHHyiIsiHpYXwYU8=; b=vPwQPWwOgHzqoi
	U75aSAGuQGEPOOtpQVDeSrlX+N8t4IVtOZUJi3IQcIZv/ENHbyj2AKu8eezOetQzJSxJrE366008I
	/mxc0QV9lKOR1C1S9FJUZZZEPH13R69pXwsnWmGheZYGQgCkwNAmxhJf8uT3jL1TTM9A0FgeForto
	VRbq/0imv0p6FG+bfV+KX7bS4ZLrU59pv7vn12G3dfSqjeWgrBbJjmoci3CScwrYQqggGyde0OEeC
	eCQWH7FsMAuKdTa6LxlgkOpotuFU7c37Q+dcgd0Vnzt1oDCllrTmbiCIeLvepD9rzo7yDhjKgb56g
	bY0jmnuaylFsyhm/Lqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYZo-00000000bwL-1dlV;
	Thu, 29 Jan 2026 20:25:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYZl-00000000bvh-2r7Y
	for kvm-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 20:25:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TI3J3s3641923
	for <kvm-riscv@lists.infradead.org>; Thu, 29 Jan 2026 20:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TIyWfuFKG9M3pO5hQmbVZSaW8RBimd7V3pBdTPjwJ6A=; b=E8Pv08Ca/oUQS9hB
	ZCNVdyUPaPmHAb0tMd7umdEzkgtxTGSdyG1uqAi43M6r2rSBv/lE44S0NvIsO7mG
	ht4+V1T+H/jRPH5MqvDVwwFkGaOQVpNkNHxuLukDN6ZsJ8bys/HeO0Jd8pkefF7I
	XwCMLPB8VHsjr5MQg1QSYDdb8IGe08ZHn2kMq402lNbe+MiVsjM244MMOqCY6uZc
	S0cpcWEsw0L3xJq7fGO2PoCFkExVUb5oP2J4cMkd5Xa0GOQuhvEEaUy3t/7n3b6C
	dsKPWTBc8HOSEm4By3h5FB25ZvI8zcoTLiZufLbAStS6YiK/ohLGtUgqicyQZ/L+
	/T4x1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05sr20m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 29 Jan 2026 20:25:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so424914085a.3
        for <kvm-riscv@lists.infradead.org>; Thu, 29 Jan 2026 12:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769718311; x=1770323111; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIyWfuFKG9M3pO5hQmbVZSaW8RBimd7V3pBdTPjwJ6A=;
        b=NnnzZEIfTSOLWvBNjDlC4oHfBEQFBGlIFtd4x370ik951FdGb9eBv1k0jFoggqxnBe
         t+TIv05bssg5q6A94i/S+GSz+57oPEByjmkhoNn4kteagVC1yjrzWqTNEp10UbyDlJt5
         r8+NdLkhmXKaMdslp4+wXbBZyltOBMiCoEeyNmw/8zuNfiBV9OOKnnDF0lzGzMusdkuU
         /UvJwb4yx5i+gpjvz7T7VKVpwNB4pOONnKeSVgc8td5JrmSZ2Sq0RwsjIsqjaku9KdXt
         rt8bweykegoSgSToS0c/wZ52IASTvkVDeaMKYxoQe/XfYGfeMv8I99PKVtsOT6zM7U/z
         2niQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769718311; x=1770323111;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TIyWfuFKG9M3pO5hQmbVZSaW8RBimd7V3pBdTPjwJ6A=;
        b=iMYenygjOJguXq/twPSpuTG6zGt2cMrH8KFD31yu2Kknnqf5Qzuav5gS9J/5quBofI
         dvD7Ax/gyd01KrsYLt+39pFdgoF4p3Oxko6E/R3rxUN5wB+qy18Wd41nbYDujZRlYQti
         QjUX0sH7I92GCLl4mIOaHT2QJ0YFmGnmyws2e8yKzzfXC/K9YE6ZYgIBh844PIDInqeU
         v3Yj6KH5u7WwQzf4t7j0EkEk/lDGGCrhLhr2ZCWSCRq32q1AB3spjH4MhcKse/FKwhXX
         bfaeFxI6+FtoV5SaXUHbVjTB4zmXNums9hx9xDsNJ47FzBwuraMsbJzpNycCFwGrbAHy
         IBlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE181+cnzZrd9Fhe6DuE2BJ/uEkTtXgGzELkWLjAhz9mVwI5nXPQR0e7jOWKxtemzMPwkOh/PH4VM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8hcqMHAeFwMHIxedIujycWj4bSXHlYD9ijUGylW2kjUpD5np8
	vp5B6iGRvJc9Quo0YhhA9Zj3Dbgn28QdaCI0O/ZIYpyeo1ETsr1IyAZ1aA590tBu01j8e8DvcjF
	8STRKT6l+t+fQQNve9vN86QBTFzRLko+7DiZaKvNVc6lSDO/zCADTLL+OmwnpC6OwMieZzzHRGr
	Df
X-Gm-Gg: AZuq6aJNTGD8RcRJWYYYDUF6sI49P7vZ+S4BAeJao+jzBfYr2E0K129nqQZW9kxghgk
	DSajp0FM7n9LTAbg9Lvm4PllSK4wnGIhjc9Q+xvNdNBTyY8eDJe/OhFinntRM1jTyAuteRvrMCv
	Xkcl2bS0vk3pvlkDCgfR+5HC6ZzQvcCPTSnAL/gFhPJcJploSwaBy/PcKh5j3y7jGldJ5fK2RXm
	V8DBNSBtYPK4c9gVotUe2qigIplUbRfvO7URsf60s9EuthHUWjqfV4l6mlm1cpOeTp8uvD7uFm7
	qUkZat+Lont/ahz+ofOU2ISOHZwsTB8DEPOHerxargDO1ADPmUzsXuwFeRrMwr6jEHDwzB5FCOW
	7Iu49V2pZ6Y3vKAIx17xvrmHQjOWld/rbpHZqIurd92rGUTkX
X-Received: by 2002:a05:620a:29d2:b0:8c5:36be:41fe with SMTP id af79cd13be357-8c9eb32be89mr118655185a.60.1769718311228;
        Thu, 29 Jan 2026 12:25:11 -0800 (PST)
X-Received: by 2002:a05:620a:29d2:b0:8c5:36be:41fe with SMTP id af79cd13be357-8c9eb32be89mr118650785a.60.1769718310701;
        Thu, 29 Jan 2026 12:25:10 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c3c6sm150902865e9.10.2026.01.29.12.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 12:25:10 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 29 Jan 2026 20:25:08 +0000
Message-Id: <DG1CS7KB3C6N.10FWH79J7UZHB@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: [SUGGESTION] KVM: RISC-V: detect gstage mode hierarchy
Cc: <guoren@kernel.org>, <ajones@ventanamicro.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <pbonzini@redhat.com>,
        <corbet@lwn.net>, <anup@brainfault.org>, <atish.patra@linux.dev>,
        <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <andrew.jones@oss.qualcomm.com>
To: <fangyu.yu@linux.alibaba.com>
References: <20260125150450.27068-1-fangyu.yu@linux.alibaba.com>
 <20260125150450.27068-2-fangyu.yu@linux.alibaba.com>
 <DG16GDMKZOBM.2QH3ZYM2WH7RO@oss.qualcomm.com>
In-Reply-To: <DG16GDMKZOBM.2QH3ZYM2WH7RO@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDE0NyBTYWx0ZWRfX0Qjhtff5r6RO
 HpxDsiBSgcyaRH3kr69wMw5G0ZYjAert8OCxkTfYzU4s7XTX8gHDlC3m3I96P/Id6ZJDLNnmTJl
 MYDmVEybWbq/67yGLGUXbYx7AhgzTVKDlu3qjOByy9XfatmgaVYbcRrFm6V7DokUDTxlZg0v7gB
 IE+K9PaFRtm8yYo2t6zkW/5HzTGMaGVCgfPBQX5yjajPxgyw9oIUc3CnCpQlHUAX0ZsCVy3dWbd
 1jJ0bOSNE91WJZuVd0ZfgOudn+6dw1SVz8jCUKth/pcjMpsus1Q5nkMLYBkJc9taPHbz0ZrgtTm
 wETbGR3TryhOnJztOlapAUusOgQJ1mG6lkdyTaPSj7VKGeKQmiTuTO+hrnQMu5dr68LNicZi04B
 sQ+qTHs22o1aqY50aJut5Vw2Tp85cCkqvQzDQnQ+pnZL1ax9wMyGl4AbgfnVteBAPoBJYALn70U
 1Rd6/5cWkI7HkrdfMIg==
X-Proofpoint-ORIG-GUID: 5AGGpOuPmzDe82LsEodpegQYqCwieygs
X-Authority-Analysis: v=2.4 cv=UsJu9uwB c=1 sm=1 tr=0 ts=697bc228 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=B30jFbksMaAZlFPmlSQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 5AGGpOuPmzDe82LsEodpegQYqCwieygs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290147
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_122513_830405_CABD9534 
X-CRM114-Status: GOOD (  16.85  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

MjAyNi0wMS0yOVQxNToyNzozNSswMDowMCwgUmFkaW0gS3LEjW3DocWZIDxyYWRpbS5rcmNtYXJA
b3NzLnF1YWxjb21tLmNvbT46Cj4gKEknbGwgcmVwbHkgd2l0aCBhIHBhdGNoIGxhdGVyLikKClNv
bWV0aGluZyBsaWtlIHRoaXMgd291bGQgYXZvaWQgYSBiaXQgb2YgdGVjaG5pY2FsIGRlYnQuClRo
ZSBzb2x1dGlvbiBjb3VsZCBiZSBldmVuIG1vcmUgZ2VuZXJpYyBieSByZXR1cm5pbmcgYSBiaXRt
YXAgb2YKc3VwcG9ydGVkIG1vZGVzLCBidXQgdGhhdCB3b3VsZCBiZSBsYXJnZXIgcmVmYWN0b3Jp
bmcuLi4KCkZlZWwgZnJlZSB0byB1c2UgaXQgaW4gdGhlIHNlcmllcywgYnV0IGJld2FyZTogb25s
eSBjb21waWxlLXRlc3RlZC4KSXQncyBsYXRlIGFuZCBob3BlIGl0IGF0IGxlYXN0IGJvb3RzLiA6
KQoKVGhhbmtzLgotLS04PC0tLQpSSVNDLVYgSVNBIGRvZXMgbm90IHJlcXVpcmUgYSBoaWVyYXJj
aHkgb2Ygc3RhbmRhcmQgaGdhdHAgbW9kZSAoaS5lLgo1N3g0IGRvZXMgbm90IGRlcGVuZCBvbiA0
OHg0IG9uciAzOXg0KSwgeWV0IGZ1dHVyZSBwYXRjaGVzIHdhbnQgdG8KYXNzdW1lIHRoYXQgdGhl
IGhpZXJhcmNoeSBleGlzdHMsIGZvciBzaW1wbGljaXR5LgoKT25seSBhY2NlcHQgYSBoZ2F0cCBt
b2RlIGlmIGFsbCBuYXJyb3dlciBtb2RlcyBhcmUgc3VwcG9ydGVkIGFzIHdlbGwuCgpBbGwgc2Vu
c2libGUgUklTQy1WIGltcGxlbWVudGF0aW9ucyBzaG91bGQgaGF2ZSB0aGUgaGllcmFyY2h5LCBz
aW5jZQppdCdzIHZlcnkgY2hlYXAgdG8gYWRkIHRoZSBuYXJyb3dlciBtb2Rlcy4KClNpZ25lZC1v
ZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckBvc3MucXVhbGNvbW0uY29tPgotLS0KVGhl
IGh1bmsgdGhhdCByZW1vdmVzIHRoZSBkZWZhdWx0IHZhbHVlcyBhdCB0aGUgYmVnaW5uaW5nIG9m
IGdzdGFnZS5jCnNob3VsZCBoYXZlIGJlZW4gYSBzZXBhcmF0ZSBwYXRjaCwgc29ycnkuCi0tLQog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmggfCAgMiArLQogYXJjaC9yaXNjdi9r
dm0vZ3N0YWdlLmMgICAgICAgICAgICAgfCA2NiArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LQogYXJjaC9yaXNjdi9rdm0vbWFpbi5jICAgICAgICAgICAgICAgfCAgNiArKy0KIDMgZmlsZXMg
Y2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV9nc3RhZ2UuaAppbmRleCA1OTVlMjE4MzE3M2UuLjE4ZGI0NzRjZTU4MyAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKQEAgLTY3LDYgKzY3LDYgQEAgdm9pZCBrdm1fcmlz
Y3ZfZ3N0YWdlX3VubWFwX3JhbmdlKHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsCiAKIHZvaWQg
a3ZtX3Jpc2N2X2dzdGFnZV93cF9yYW5nZShzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLCBncGFf
dCBzdGFydCwgZ3BhX3QgZW5kKTsKIAotdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0
KHZvaWQpOwordW5zaWduZWQgbG9uZyBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KHZvaWQp
OwogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jIGIvYXJjaC9y
aXNjdi9rdm0vZ3N0YWdlLmMKaW5kZXggYjY3ZDYwZDcyMmMyLi42NzhiMzA0NTUzYmMgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFn
ZS5jCkBAIC0xMSwxMyArMTEsOCBAQAogI2luY2x1ZGUgPGxpbnV4L3BndGFibGUuaD4KICNpbmNs
dWRlIDxhc20va3ZtX2dzdGFnZS5oPgogCi0jaWZkZWYgQ09ORklHXzY0QklUCi11bnNpZ25lZCBs
b25nIGt2bV9yaXNjdl9nc3RhZ2VfbW9kZSBfX3JvX2FmdGVyX2luaXQgPSBIR0FUUF9NT0RFX1NW
MzlYNDsKLXVuc2lnbmVkIGxvbmcga3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzIF9fcm9fYWZ0
ZXJfaW5pdCA9IDM7Ci0jZWxzZQotdW5zaWduZWQgbG9uZyBrdm1fcmlzY3ZfZ3N0YWdlX21vZGUg
X19yb19hZnRlcl9pbml0ID0gSEdBVFBfTU9ERV9TVjMyWDQ7Ci11bnNpZ25lZCBsb25nIGt2bV9y
aXNjdl9nc3RhZ2VfcGdkX2xldmVscyBfX3JvX2FmdGVyX2luaXQgPSAyOwotI2VuZGlmCit1bnNp
Z25lZCBsb25nIGt2bV9yaXNjdl9nc3RhZ2VfbW9kZSBfX3JvX2FmdGVyX2luaXQ7Cit1bnNpZ25l
ZCBsb25nIGt2bV9yaXNjdl9nc3RhZ2VfcGdkX2xldmVscyBfX3JvX2FmdGVyX2luaXQ7CiAKICNk
ZWZpbmUgZ3N0YWdlX3B0ZV9sZWFmKF9fcHRlcCkJXAogCShwdGVfdmFsKCooX19wdGVwKSkgJiAo
X1BBR0VfUkVBRCB8IF9QQUdFX1dSSVRFIHwgX1BBR0VfRVhFQykpCkBAIC0zMTMsNDcgKzMwOCwz
OCBAQCB2b2lkIGt2bV9yaXNjdl9nc3RhZ2Vfd3BfcmFuZ2Uoc3RydWN0IGt2bV9nc3RhZ2UgKmdz
dGFnZSwgZ3BhX3Qgc3RhcnQsIGdwYV90IGVuZAogCX0KIH0KIAotdm9pZCBfX2luaXQga3ZtX3Jp
c2N2X2dzdGFnZV9tb2RlX2RldGVjdCh2b2lkKQorc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25n
IF9faW5pdCBfX2t2bV9yaXNjdl9nc3RhZ2VfbW9kZV9kZXRlY3Qodm9pZCkKIHsKICNpZmRlZiBD
T05GSUdfNjRCSVQKLQkvKiBUcnkgU3Y1N3g0IEctc3RhZ2UgbW9kZSAqLwotCWNzcl93cml0ZShD
U1JfSEdBVFAsIEhHQVRQX01PREVfU1Y1N1g0IDw8IEhHQVRQX01PREVfU0hJRlQpOwotCWlmICgo
Y3NyX3JlYWQoQ1NSX0hHQVRQKSA+PiBIR0FUUF9NT0RFX1NISUZUKSA9PSBIR0FUUF9NT0RFX1NW
NTdYNCkgewotCQlrdm1fcmlzY3ZfZ3N0YWdlX21vZGUgPSBIR0FUUF9NT0RFX1NWNTdYNDsKLQkJ
a3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzID0gNTsKLQkJZ290byBkb25lOwotCX0KLQotCS8q
IFRyeSBTdjQ4eDQgRy1zdGFnZSBtb2RlICovCi0JY3NyX3dyaXRlKENTUl9IR0FUUCwgSEdBVFBf
TU9ERV9TVjQ4WDQgPDwgSEdBVFBfTU9ERV9TSElGVCk7Ci0JaWYgKChjc3JfcmVhZChDU1JfSEdB
VFApID4+IEhHQVRQX01PREVfU0hJRlQpID09IEhHQVRQX01PREVfU1Y0OFg0KSB7Ci0JCWt2bV9y
aXNjdl9nc3RhZ2VfbW9kZSA9IEhHQVRQX01PREVfU1Y0OFg0OwotCQlrdm1fcmlzY3ZfZ3N0YWdl
X3BnZF9sZXZlbHMgPSA0OwotCQlnb3RvIGRvbmU7Ci0JfQotCi0JLyogVHJ5IFN2Mzl4NCBHLXN0
YWdlIG1vZGUgKi8KIAljc3Jfd3JpdGUoQ1NSX0hHQVRQLCBIR0FUUF9NT0RFX1NWMzlYNCA8PCBI
R0FUUF9NT0RFX1NISUZUKTsKLQlpZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdBVFBfTU9E
RV9TSElGVCkgPT0gSEdBVFBfTU9ERV9TVjM5WDQpIHsKLQkJa3ZtX3Jpc2N2X2dzdGFnZV9tb2Rl
ID0gSEdBVFBfTU9ERV9TVjM5WDQ7Ci0JCWt2bV9yaXNjdl9nc3RhZ2VfcGdkX2xldmVscyA9IDM7
Ci0JCWdvdG8gZG9uZTsKLQl9CisJaWYgKChjc3JfcmVhZChDU1JfSEdBVFApID4+IEhHQVRQX01P
REVfU0hJRlQpICE9IEhHQVRQX01PREVfU1YzOVg0KQorCQlyZXR1cm4gSEdBVFBfTU9ERV9PRkY7
CisKKwljc3Jfd3JpdGUoQ1NSX0hHQVRQLCBIR0FUUF9NT0RFX1NWNDhYNCA8PCBIR0FUUF9NT0RF
X1NISUZUKTsKKwlpZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdBVFBfTU9ERV9TSElGVCkg
IT0gSEdBVFBfTU9ERV9TVjQ4WDQpCisJCXJldHVybiBIR0FUUF9NT0RFX1NWMzlYNDsKKworCWNz
cl93cml0ZShDU1JfSEdBVFAsIEhHQVRQX01PREVfU1Y1N1g0IDw8IEhHQVRQX01PREVfU0hJRlQp
OworCWlmICgoY3NyX3JlYWQoQ1NSX0hHQVRQKSA+PiBIR0FUUF9NT0RFX1NISUZUKSAhPSBIR0FU
UF9NT0RFX1NWNTdYNCkKKwkJcmV0dXJuIEhHQVRQX01PREVfU1Y0OFg0OworCisJcmV0dXJuIEhH
QVRQX01PREVfU1Y1N1g0OwogI2Vsc2UgLyogQ09ORklHXzMyQklUICovCi0JLyogVHJ5IFN2MzJ4
NCBHLXN0YWdlIG1vZGUgKi8KIAljc3Jfd3JpdGUoQ1NSX0hHQVRQLCBIR0FUUF9NT0RFX1NWMzJY
NCA8PCBIR0FUUF9NT0RFX1NISUZUKTsKLQlpZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdB
VFBfTU9ERV9TSElGVCkgPT0gSEdBVFBfTU9ERV9TVjMyWDQpIHsKLQkJa3ZtX3Jpc2N2X2dzdGFn
ZV9tb2RlID0gSEdBVFBfTU9ERV9TVjMyWDQ7Ci0JCWt2bV9yaXNjdl9nc3RhZ2VfcGdkX2xldmVs
cyA9IDI7Ci0JCWdvdG8gZG9uZTsKLQl9CisJaWYgKChjc3JfcmVhZChDU1JfSEdBVFApID4+IEhH
QVRQX01PREVfU0hJRlQpICE9IEhHQVRQX01PREVfU1YzMlg0KQorCQlyZXR1cm4gSEdBVFBfTU9E
RV9PRkY7CisKKwlyZXR1cm4gSEdBVFBfTU9ERV9TVjMyWDQ7CiAjZW5kaWYKK30KIAotCS8qIEtW
TSBkZXBlbmRzIG9uICFIR0FUUF9NT0RFX09GRiAqLwotCWt2bV9yaXNjdl9nc3RhZ2VfbW9kZSA9
IEhHQVRQX01PREVfT0ZGOwotCWt2bV9yaXNjdl9nc3RhZ2VfcGdkX2xldmVscyA9IDA7CisvKiBX
ZSBjb3VsZCBwcm9iYWJseSBvbWl0IHRoZSBIR0FUUCB3cml0ZSBhbmQgZmVuY2UuICovCit1bnNp
Z25lZCBsb25nIF9faW5pdCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KHZvaWQpCit7CisJ
dW5zaWduZWQgbG9uZyBnc3RhZ2VfbW9kZSA9IF9fa3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVj
dCgpOwogCi1kb25lOgogCWNzcl93cml0ZShDU1JfSEdBVFAsIDApOwogCWt2bV9yaXNjdl9sb2Nh
bF9oZmVuY2VfZ3ZtYV9hbGwoKTsKKworCXJldHVybiBnc3RhZ2VfbW9kZTsKIH0KZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva3ZtL21haW4uYyBiL2FyY2gvcmlzY3Yva3ZtL21haW4uYwppbmRleCA0
NTUzNmFmNTIxZjAuLjU4ZmQ2YWU4ZTA0YSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vbWFp
bi5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL21haW4uYwpAQCAtMTA0LDE5ICsxMDQsMjMgQEAgc3Rh
dGljIGludCBfX2luaXQgcmlzY3Zfa3ZtX2luaXQodm9pZCkKIAlpZiAocmMgJiYgcmMgIT0gLUVO
T0RFVikKIAkJcmV0dXJuIHJjOwogCi0Ja3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCgpOwor
CWt2bV9yaXNjdl9nc3RhZ2VfbW9kZSA9IGt2bV9yaXNjdl9nc3RhZ2VfbW9kZV9kZXRlY3QoKTsK
IAlzd2l0Y2ggKGt2bV9yaXNjdl9nc3RhZ2VfbW9kZSkgewogCWNhc2UgSEdBVFBfTU9ERV9TVjMy
WDQ6CiAJCXN0ciA9ICJTdjMyeDQiOworCQlrdm1fcmlzY3ZfZ3N0YWdlX3BnZF9sZXZlbHMgPSAy
OwogCQlicmVhazsKIAljYXNlIEhHQVRQX01PREVfU1YzOVg0OgogCQlzdHIgPSAiU3YzOXg0IjsK
KwkJa3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzID0gMzsKIAkJYnJlYWs7CiAJY2FzZSBIR0FU
UF9NT0RFX1NWNDhYNDoKIAkJc3RyID0gIlN2NDh4NCI7CisJCWt2bV9yaXNjdl9nc3RhZ2VfcGdk
X2xldmVscyA9IDQ7CiAJCWJyZWFrOwogCWNhc2UgSEdBVFBfTU9ERV9TVjU3WDQ6CiAJCXN0ciA9
ICJTdjU3eDQiOworCQlrdm1fcmlzY3ZfZ3N0YWdlX3BnZF9sZXZlbHMgPSA1OwogCQlicmVhazsK
IAlkZWZhdWx0OgogCQlrdm1fcmlzY3ZfbmFjbF9leGl0KCk7Ci0tIAoyLjUxLjAKCgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
