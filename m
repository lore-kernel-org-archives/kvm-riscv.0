Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607BF105F7AF
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 14:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wL7z+DRNvynlehUGxArpoekU6Fl3WdD4VQ0eL5yhH+g=; b=1Az9vGa1J1gddo
	3i/QT7BBgtMRh3Q/2o1yVYv89l3w4JBnNVaem7ng0EG9nK5URhKncu8n8x11A+9bi3fmGsTTKxNAq
	OIlmiuh9D16OrsjhhXwBEb7oREiPCu/zzkgg4Rx1Xd8cr6Oxc6YnOvsEtUJNYiKsJ2diw4GP8ouUV
	MGmvMFS6XV4mnSpdrtP5u53AYegJRK9cm3z6mTvNmOqDFF59JrDa0fNH/z5qrfohNpicGHdF2x5Mu
	QwFLsAUw6a2XYM9vpLhWSixS4Ul2oVs+l7OXI2LHor7VXCNoGl5zStgUsGjIrf4fyTmFBdHAt6A80
	yGFFfnXxSgLwcoL3zZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13Hj-00000000LgJ-48Wx;
	Fri, 13 Mar 2026 14:14:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13Hg-00000000Lf6-2wuH
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 14:14:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA7mDB1749131
	for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yb8otKhnt0ZfdX0TM0MYAhAHgSLa2dwwdNl7K8IPkJY=; b=mIbw2WhsYb6OPwUq
	6cyyk5xfsBmRsyPT+GcQe17MXyaIHACsQ7bjCNpfVFpXm9gX+79rHui8VDQdh5ZB
	EWsRmjO4ZlbFmpJb2To3lTpeUD4rRzFrGGE5cnUvleMYzyzYS1sV0XshX3HrWlfL
	9ylyBNwlkkO4dgrFtsC48J8UzPIhFKwfn5GUfBzD4Ea5blNXld6H7wG/OAmnGbBG
	AK0K5nBUEPcJOYVn5eA5/vlgcpr/08GRK4iEAq83HY7/FldBiVE/Y7bK5KhukRF5
	XtNM2zZb77HYHN/EuLYKAtY9u9w1lZk6CHxW9kLdKUKJ1cFlBt8ByeMZ2L37HoXk
	P82DlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6gsrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:14:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7fec8d44so1449430385a.2
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773411275; x=1774016075; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yb8otKhnt0ZfdX0TM0MYAhAHgSLa2dwwdNl7K8IPkJY=;
        b=PvFIkDlRMuiI0EE+aJrdHjRxFoWHhgSI2lG8wVMtmbOAjDAw+0bqFKi7FUuA2jr92D
         20HfSCvxcdylM7uvlUK0N9Dh/KwmtYomWPRKi7Hv2hKM7gukSfGuAnpyJrtmwDiEh8JZ
         ON9fMMmyHBfJEqjz3qTzrpOPdh5xkFPDWUeslSjxIGEqtYqlxgSGH3MbkdueQD31dK/b
         rYJ5WvI2k4Va3YjJZw9s45Ljdugoqb6PIg6rAVLWq8caodF3p92HC8J793MpEcJvFLps
         jAXIoXDjkMnaaIwTNEcsI0jxehkzQyybpqm3IzC3vNasPJUCjES7E1dptUs4Cgg4qc+R
         twDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411275; x=1774016075;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yb8otKhnt0ZfdX0TM0MYAhAHgSLa2dwwdNl7K8IPkJY=;
        b=MCFBWQ+vA6i7bs6mUKlqMQDqPLuQm+8/xDCU/w1Cx0aE7XokzG8bMflffmiiKOjyKl
         aZObeXF4txZGCLYECfQYNj04BJFytyV5QO0FW45pwr9EWeECDnpne438Mve4724PlKSs
         GU03NifIzPkig9XX/STpkl+jUw6D0mTocuUlYrLSA73/km9XeK6Zg9unAfvbt1g7CpiW
         OKYsywJ7pgbVPLwmaWtc+VoqVZZl/X9aMmBLKfm4kdS7nghtJJZ5V09RFILWhpov50tW
         D0GBwnSwo7Y/yfLmUn5vzDiIjqpkKrT9f/FOAVPWMHl93eML7XrE/r6Xht5RnBkKyT7n
         aK8A==
X-Forwarded-Encrypted: i=1; AJvYcCXFNuw1TQKat2JfpMCjGNmfddrSRyxlHu70k9UtEYjV+kznJ2Vov3fXTK/AR6cZGJMBseRSmIL+Dz0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj2hZz/rhie5nk6WwwdymV7EM/Myxp+UFmaVxGNwQSmQCW7hYY
	7nwom+I4bxHMMCYvqlFZsfFgna0IDZMSUuUlt7eFDMtqafUrbPm3Z+KJEUiDYMQBVhsUI6vVk71
	EGtbNh7U/f99DcVLTurmUHrem+6S97xdjt5SI/Ap+BA7Hprbzw/EsWGyJ+HAb2W93jqA9
X-Gm-Gg: ATEYQzwJTFx0uvcbRzKx/ceRddbBGD2epqRizfKXOKGE4fLIJWsrWC4AeIID8smJaR6
	Txtm8J6hy8ECmrpdMqwIqHglLq/TiWymZHbG6ZsoRjmd0oIh3k/SJfmbzRoUg8rRgavliYryTHW
	p1/xKT6NlyraVQFVRhKdW64g0DNF4McYBLOV4B37rdS6XsJs1xl5OITN8VLi1iKk67FHZHsX1BZ
	uRvN8kS/Z30Xg4T9OwgbcrYp69mbQpKcfIsuVu9yMR5cYYjcDOSPms7vSxzp2XIk+j5pl3S+XKt
	cflJo82izV+8uh3fxtD7FUuDKOVQ44S0yTIGfJ49UQ90CX7qJKyD2JdegiNS1athbcD8fix2myv
	m2T/gr6yKDUnMmiR3/FsWGAY4sB0RK8UpiaPWgNzOyrCwRBZ0KlLHHWEXWnTF
X-Received: by 2002:a05:620a:170f:b0:8cb:3288:6777 with SMTP id af79cd13be357-8cdb5a61b1fmr457591785a.28.1773411275271;
        Fri, 13 Mar 2026 07:14:35 -0700 (PDT)
X-Received: by 2002:a05:620a:170f:b0:8cb:3288:6777 with SMTP id af79cd13be357-8cdb5a61b1fmr457584385a.28.1773411274689;
        Fri, 13 Mar 2026 07:14:34 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm44367405e9.7.2026.03.13.07.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:14:33 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 13 Mar 2026 15:14:32 +0100
Message-Id: <DH1PTVPUM2UR.2J53ICCVVPAFA@oss.qualcomm.com>
Subject: Re: [PATCH 05/27] RISC-V: KVM: Factor-out ISA checks into separate
 sources
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Alexandre Ghiti" <alex@ghiti.fr>, "Shuah Khan" <shuah@kernel.org>,
        "Anup
 Patel" <anup@brainfault.org>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>
To: "Anup Patel" <anup.patel@oss.qualcomm.com>,
        "Paolo Bonzini"
 <pbonzini@redhat.com>,
        "Atish Patra" <atish.patra@linux.dev>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-6-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-6-anup.patel@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMyBTYWx0ZWRfX8H91Poo46tKL
 mIaziBkdAaGCzdG27aJQJffVarn7lz1tKakj8WyIjNOO9+WNKcaVEMyQmfZhQ2/xHYZx+qrx6CC
 4YrfugIYWT0S6Nqu0qxHfjTa7IWb3M9QfY7dwTXi9UnetI9RdCJAXwYzJSfFXh3nS1MOx9TLXIC
 lz+IXkq0+zNcTkMcjfzfRoM1NDeUMlnO49qX3LPCCmw16treL4Wc43UHOzuumxKz4znl7wfU2uj
 QlA2AG6okHFoyObmQJq1DivOZL+nSYCj2Rtqun6Ppo/Mt+XDaBRT6YFOnU3TTzOgAWIh/CEq14U
 mmuokbFU81RO4k4i6Fra0D1qZi/IHL6ysAsPdfZGGjP8nsSTUbd55V52X1l8wefWQzllTnvCJSw
 yP+8d07r3od/yDADTIKSPSbnMXl+qCIUfO4YRofNnjpCO4mwFPX6QSQrrZ0asm2FnBsfgF1g7bE
 Q2FWnah/VGCaFu9GyHg==
X-Proofpoint-GUID: aC5j7D1p080Ba3D5flQ2hn3_nhpQuXMu
X-Proofpoint-ORIG-GUID: aC5j7D1p080Ba3D5flQ2hn3_nhpQuXMu
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b41bcc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sIBLlZgNAvny2aHwhmQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_071436_744958_A2212B4E 
X-CRM114-Status: UNSURE (   8.93  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

MjAyNi0wMS0yMFQxMzoyOTo1MSswNTozMCwgQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVh
bGNvbW0uY29tPjoKPiBUaGUgS1ZNIElTQSBleHRlbnNpb24gcmVsYXRlZCBjaGVja3MgYXJlIG5v
dCBWQ1BVIHNwZWNpZmljIGFuZAo+IHNob3VsZCBiZSBmYWN0b3JlZCBvdXQgb2YgdmNwdV9vbmVy
ZWcuYyBpbnRvIHNlcGFyYXRlIHNvdXJjZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+IEBA
IC0xMiw2ICsxMiw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9rdm1faG9zdC5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvdWFjY2Vzcy5oPgo+ICAjaW5jbHVkZSA8bGludXgvY3B1ZmVhdHVyZS5oPgo+ICsj
aW5jbHVkZSA8YXNtL2t2bV9pc2EuaD4KCkkgZ3Vlc3MgPGNwdWZlYXR1cmUuaD4gaXNuJ3QgbmVl
ZGVkIGFueW1vcmUsCgpSZXZpZXdlZC1ieTogUmFkaW0gS3LEjW3DocWZIDxyYWRpbS5rcmNtYXJA
b3NzLnF1YWxjb21tLmNvbT4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8va3ZtLXJpc2N2Cg==
