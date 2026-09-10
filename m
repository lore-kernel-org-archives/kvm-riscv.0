Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9654CC79F9F
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfSkWofMB7LU7/E0lSEYAHgoPTNbuWdW7JAu16+zHn4=; b=YlI+Bbz9sWx+EA
	7z2OjdcaLE1lZPXP84LzmiHqxNUTzfWqG2SUSe1w74ql4tDMTsHLgBZH5GPM5DaZwy74SitMXa2ZI
	wf5nl9fOh3/m+KuMGbI1Wu3Ye6dTAf04AC/h2u/dkkebVzS0QzH19aB2rIP/7miV50CK1/HP7gLum
	1K8vCQPyhMWpCjRfIqWij9koSl2EARAA4+W7tDChywJN4E/4S4Uq49nWEvnc8LSoH5QDYUL+oDVTc
	s/TyGEu964Sx+3X2dZ85EsIInf6VjMZC6B5fJWlk0vVoqh9JgBUc5sQFumgeltqLmpfUuMuPI6blI
	/hc2LAeszgrD6oQc0+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bOq-0000000DvnL-0ZRG;
	Thu, 10 Sep 2026 09:48:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bOm-0000000Dvla-2WKw
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 09:48:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8qJlX644511
	for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 09:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fe1R8wzIKX66YSLfrokubx/6sXM/pQiZhT04/7N60Yo=; b=F4KnF94ThZPlCPXB
	ELuACDM7vfX4nzSaDQPZ2nwfPYa2kiethzdgojbYncp/GJlM1PpgA8MVhziljHN0
	BMbRolZ5FAeZf0jub24aO0L3T9DtkEcfIEALAv0acWO/t1wPgcEvOs2sWoRn+Aap
	biHeqtD079eamRlmvVsXGYHa8r81KTcGP2nxsCgF4ukpAjn2rsbbARgaSROcSUJK
	LQtnlrO4tNxIrr74DK8xfSTLUlzJcbwUarRsEBHldvcrGARMsOxRqzMQfIJLLWeL
	nxhu+fhvZkFKfTrgJKhnQ7en80JXJF6QQ+mGHAEc0W01WGcqVlzJZWR84QN/6KrO
	PYr4dg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg39tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 09:48:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so3168893a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 02:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789033730; cv=none;
        d=google.com; s=arc-20260327;
        b=IGpVXMU6NdghhB0PQUmPKYJBHCG4SLR5egI7OQmkOw4kODV0LApl1lWql4Elg3+nn9
         07oy53A5S80UqepHqZLo5x5g2B/9migNDR2ZgIL9B+QWdO6H+4lE0+rIcvifdcB3/dZ3
         BFe5Ll8qxDUDyHC1Cf3XunlWmI3zJSYr9KSyrZZ0eGKEGr5OVnXHVKHJvRYrTSXJgz4E
         +h2/siFACcsaKRg+RuWZ7oPIMaHWzWVZptkSjzEgTG9TYG4rGR1SsdTueqrSdKuIHxFZ
         Cow79SyE/3pvgmc0VZQ9HQO+IaTVfFLWhNo+Puh8uxQX+8Be06ZpDpDA4L8MVXtGg6mz
         ygBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fe1R8wzIKX66YSLfrokubx/6sXM/pQiZhT04/7N60Yo=;
        fh=Ty/+WhbBHp6giCCCUQJuy7QcWe5btw0ZR+7HH4O0Q/o=;
        b=f7zfRLMtCGxMcBBg0N6kM3APByvkZ17if9ktMCu689DIp83y8u76cIKKU+rTiFFCjo
         DlJuYrLoc/LxBWrCH+kxCnkUyrBk2ZvwFZ+/AvApoxy/Tg1Nxq+coMAAr93X3t6e5FZd
         sFPhOWK9bxoG0VUGvdCkjQj0jIgivjm94XiacRD/8jv7gqZPkHARGY0+9X6xeqX/7MH5
         wJNy8uBbOCZzUNjGGJWucSX9IRjIw3SAfXptqTov8YzNKuYxpWpV4xC1QU2Vj0tQoihI
         KqXV4iYDPQEkmDRI+IG15Ie9X3k2ECsAX6IHUa3AmJilFciiTQqdP+h8mahajxTzijm2
         6zIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789033730; x=1789638530; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fe1R8wzIKX66YSLfrokubx/6sXM/pQiZhT04/7N60Yo=;
        b=Toj+udQnclupYXa91tLfZi8j1ZTTNwNpv9Rls0j3rQ5n2LE7cGTuMNg67EY9JBLpJj
         Hy8FYSrahrWE7ryDoHFBGeAiZSL9Slq+ykYRB8E3ymEHFxLYas8/xFEC9BR64ZHGEwqG
         oA1+OciI71IKSnHXji7BCCsMXPa6IdYROFFF9e0W+QcucnGaEIizgRskdRT99cjcmjjL
         LyoUCxjtLJA0/wq3s5zO6wytlwYL/2HYw+acPGVVQVtuzfkcS3xWfDw6j3XiofDAAJnj
         /0Fb+yvJja0KvD3coIvZGTPH/OVazd6zl+1xPFcXrPvrYRmgi+fSWjMcRg8ZfSwZxCrp
         FtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033730; x=1789638530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fe1R8wzIKX66YSLfrokubx/6sXM/pQiZhT04/7N60Yo=;
        b=O4g8DIRx0HNJAC4lDoEnGuIS4UQ/V70nar4ndjRmM1vGtMczCBCYsnaBPt5NST9/pu
         TtFAl2ZMa+nlC0hREdPq2GIKs7YLH8GdW5w6YcR4rMujaaGUH+j1T6ZccO4Rl6Cr02Js
         R4r0j/4s1kLq2/stV0UXAfl6R4sG/Dx7ayDaqQGD3XultQbCAHNu/cb27fO29Hlzyajy
         i5NlRFAhsJyYAftFf1NiLIDsjhQdZstYwYbZ2hdb/YupmINK06zq5x7uGbOSZI9Gykoc
         ndw/PmERgfOPUe9Pz/52t7J9HwHkGPrSLwmsFZI00tqKfp6Bd0H8Xe6jM5KPJZeeCfCZ
         P8Ug==
X-Forwarded-Encrypted: i=1; AKwUvBy4q/X2nolfOz+DcQlRxhxvarfT9TZdjvA4tzq4yZ1eLNirDMuo4rkMwvxKDMM5IDi8FbKoOqNPSao=@lists.infradead.org
X-Gm-Message-State: AFuF++mk81UqxpwWKsEOeWmxsDUjjha1NSPTaWk6wOlqRuBaLu+RMh7r
	EfOQkj212VaidSAVvxtlpLsA2zD5IF32W6z4Yw25k4F8bu9v4EyfeQiaJ2R+fLgUSCdKjzjRbXU
	EvXQkLEPduvZwZ5i2Va4KQ0PI7pQqgzZoyXGWLd9tqhxykU1itWpLmzYsBEsPji9ha2etWEHL+r
	zuUZtQZdaFYg2p67j2/9msqQ225/d0NxXqaDK11yORUXE=
X-Gm-Gg: AYBFou0DJ/WAL/e4o1GAgxfNqtxQz8tpUjpiZH4m7+21KxTenEJoe1WQ7sqxaq4+mWz
	m2gYbqTiENHzVOiq1Xjl8TxWS8K/faTlMMwVGtZQA2fuNKiJ4AAJLUmwsS8/mOqAfTBl22UMBeZ
	xtIx4erkq4x4Eb1OlvP1sFZ4SZ5mNXbWU/8Q7mnbfkZtmRACu4RO+abMjUJA==
X-Received: by 2002:a17:90b:5485:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39d70c2f16emr9938804a91.24.1789033730186;
        Thu, 10 Sep 2026 02:48:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5485:b0:398:9be6:f999 with SMTP id
 98e67ed59e1d1-39d70c2f16emr9938760a91.24.1789033729754; Thu, 10 Sep 2026
 02:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260721073612.137259-1-xb@ultrarisc.com> <20260810-imsic-attr-race-v2-1-00ed95ad321e@ultrarisc.com>
In-Reply-To: <20260810-imsic-attr-race-v2-1-00ed95ad321e@ultrarisc.com>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:18:36 +0530
X-Gm-Features: AcwNN1VtrgITlL2Xz8ROk6p7GYj2cQAUch2tRwnfxZo4Abg2uCG431NY2Z7hSEs
Message-ID: <CABBgwmtrZY_KB+ffy5At3sz4FjOqkePiDwCEsF-pG7ZBJBOxBw@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
To: xb@ultrarisc.com
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa27d03 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=Lx1EvxgrAAAA:8 a=W-_n0kkjAAAA:8
 a=BwDWKhTLMd55pYuKsv8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=ZFi1QaP_tuf8dODdgmj-:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-GUID: fGuyQbjg-Jcwoj_eE_ZVfnTiGsziVIqG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfX+/IHZbc03kwC
 rtcNHBnQCrc0F46I2jz52ZxwL898PTIMjttFm2cGA8gR9TOoiKYdZ2XCurivIyMkut4+q5QPXW/
 KNn1LfcYCegzxfkCqxZ2w+WcFY4YXvYAliTGf0ymCBrasKrUliFKSkKeO/RbpsQ2RnCy0ffIQRe
 zRP9VikuDZxqhXzipiHQlBNzb8WVP55t7DH3K/NCFZ+xG5DBJ/S+jp8b3xTkqwfIMol8n4hIx9b
 hVHOnUderK1coVTQE8WU2sC/vSmtBKilfKVGMzwKb3NcA4hUN3MAKtjSPIgJDNSsSP99owYiIOe
 OoznP36/wuKz+5tDBV4NJn/NluP2bkuUjyM4OccV55gWJ6QZPfxG795c91vYyF17Mfhv0D0uBGw
 qgrNfCiCH0NUtJhcC7oRbCVSSjJt+5sIKGFBjeVtEC1D8MSua+YSYbXGfNeBWnab+MqSkteLoq5
 dyd2fk/qy2uywFI3aIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExMSBTYWx0ZWRfXwKhp1KLwzBfl
 X2zso148e9bw6rTaAiQaSnZI1UIqYNOB1VLb+ml6h8aiwgHzRyVFdLYQiWf6UrrSe+CXNwYoZPF
 3zVwhy43NUrbjnWTuD3Ar+tlf5TW6Y0=
X-Proofpoint-ORIG-GUID: fGuyQbjg-Jcwoj_eE_ZVfnTiGsziVIqG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_024852_784596_9268C122 
X-CRM114-Status: GOOD (  22.74  )
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

T24gTW9uLCBBdWcgMTAsIDIwMjYgYXQgNjo1MeKAr0FNIFhpZSBCbyB2aWEgQjQgUmVsYXkKPGRl
dm51bGwreGIudWx0cmFyaXNjLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IFhpZSBC
byA8eGJAdWx0cmFyaXNjLmNvbT4KPgo+IEtWTSBkZXZpY2UgaW9jdGxzIGFyZSBub3Qgc2VyaWFs
aXplZCBhZ2FpbnN0IEtWTV9SVU4uIEFzIGEgcmVzdWx0LAo+IGt2bV9yaXNjdl9haWFfaW1zaWNf
cndfYXR0cigpIGNhbiBzbmFwc2hvdCB0aGUgcGh5c2ljYWwgQ1BVIGFuZCBIR0VJIG9mCj4gYW4g
SU1TSUMgVlMtZmlsZSBiZWZvcmUgYSBjb25jdXJyZW50IHZDUFUgbWlncmF0aW9uIHJlbGVhc2Vz
IGl0Lgo+Cj4gVGhlIEhHRUkgY2FuIHRoZW4gYmUgYWxsb2NhdGVkIHRvIGFub3RoZXIgdkNQVSBi
ZWZvcmUgaW1zaWNfdnNmaWxlX3J3KCkKPiB1c2VzIHRoZSBzdGFsZSB0dXBsZS4gQSBHRVQgb3Ig
U0VUIGF0dHJpYnV0ZSBtYXkgY29uc2VxdWVudGx5IGFjY2VzcyB0aGUKPiBuZXcgb3duZXIncyBp
bnRlcnJ1cHQgZmlsZS4KPgo+IFNlcmlhbGl6ZSB0aGUgZW50aXJlIElNU0lDIGF0dHJpYnV0ZSBv
cGVyYXRpb24gd2l0aCB0aGUgdGFyZ2V0IHZDUFUKPiBtdXRleC4gVGhpcyBwcmV2ZW50cyB0aGUg
VlMtZmlsZSBmcm9tIGJlaW5nIG1pZ3JhdGVkIGFuZCByZWN5Y2xlZCB1bnRpbAo+IHRoZSBhdHRy
aWJ1dGUgYWNjZXNzIGNvbXBsZXRlcy4gQWNxdWlyZSB0aGUgbXV0ZXgga2lsbGFibHkgc28gdGhh
dCB0aGUKPiBkZXZpY2UgaW9jdGwgcmVtYWlucyBpbnRlcnJ1cHRpYmxlIHdoaWxlIHdhaXRpbmcg
Zm9yIEtWTV9SVU4gdG8gZmluaXNoLgo+Cj4gRml4ZXM6IGRiOGI3ZTk3ZDYxMyAoIlJJU0MtVjog
S1ZNOiBBZGQgaW4ta2VybmVsIHZpcnR1YWxpemF0aW9uIG9mIEFJQSBJTVNJQyIpCj4gQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBYaWUgQm8gPHhiQHVsdHJhcmlz
Yy5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5v
cmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNy4zLXJjWAoKVGhhbmtzLApBbnVwCgo+
IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBVc2UgbXV0ZXhfbG9ja19raWxsYWJsZSgpIGFuZCBy
ZXR1cm4gLUVJTlRSIHdoZW4gaW50ZXJydXB0ZWQuCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjYwNzIxMDczNjEyLjEzNzI1OS0xLXhiQHVsdHJhcmlzYy5jb20KPiAtLS0K
PiAgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgfCAxMSArKysrKysrKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMK
PiBpbmRleCBkMzhmNWRlMDguLjc0ZjUyMGU1NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2
bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gQEAgLTk2
OSw5ICs5NjksMTQgQEAgaW50IGt2bV9yaXNjdl9haWFfaW1zaWNfcndfYXR0cihzdHJ1Y3Qga3Zt
ICprdm0sIHVuc2lnbmVkIGxvbmcgdHlwZSwKPiAgICAgICAgIGlmICghdmNwdSkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4KPiArICAgICAgIGlmIChtdXRleF9sb2NrX2tpbGxh
YmxlKCZ2Y3B1LT5tdXRleCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVFI7Cj4gKwo+
ICAgICAgICAgaW1zaWMgPSB2Y3B1LT5hcmNoLmFpYV9jb250ZXh0Lmltc2ljX3N0YXRlOwo+IC0g
ICAgICAgaWYgKCFpbXNpYykKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gKyAg
ICAgICBpZiAoIWltc2ljKSB7Cj4gKyAgICAgICAgICAgICAgIHJjID0gLUVOT0RFVjsKPiArICAg
ICAgICAgICAgICAgZ290byBvdXRfdW5sb2NrOwo+ICsgICAgICAgfQo+ICAgICAgICAgaXNlbCA9
IEtWTV9ERVZfUklTQ1ZfQUlBX0lNU0lDX0dFVF9JU0VMKHR5cGUpOwo+Cj4gICAgICAgICByZWFk
X2xvY2tfaXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncyk7Cj4gQEAgLTk5NSw2ICsx
MDAwLDggQEAgaW50IGt2bV9yaXNjdl9haWFfaW1zaWNfcndfYXR0cihzdHJ1Y3Qga3ZtICprdm0s
IHVuc2lnbmVkIGxvbmcgdHlwZSwKPiAgICAgICAgICAgICAgICAgcmMgPSBpbXNpY192c2ZpbGVf
cncodnNmaWxlX2hnZWksIHZzZmlsZV9jcHUsIGltc2ljLT5ucl9laXgsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlzZWwsIHdyaXRlLCB2YWwpOwo+Cj4gK291dF91bmxv
Y2s6Cj4gKyAgICAgICBtdXRleF91bmxvY2soJnZjcHUtPm11dGV4KTsKPiAgICAgICAgIHJldHVy
biByYzsKPiAgfQo+Cj4KPiAtLS0KPiBiYXNlLWNvbW1pdDogYjk1ZjAzZjA0ZDQ3NWFhNjcxOWQx
NWE2MzZkZGYzMjIyMmQ1NTY1Nwo+IGNoYW5nZS1pZDogMjAyNjA4MTAtaW1zaWMtYXR0ci1yYWNl
LTA2NzcyYTA0NDUwZQo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gWGllIEJvIDx4YkB1bHRyYXJp
c2MuY29tPgo+Cj4KPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
