Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E6E105F7A6
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWKw8ok+7PnAMHVRBtxzH3peJxh9eRm7lwGsnQr/cQ8=; b=42zO3EoiE9VZu4
	G4gwNnA9zh1I1FM3jgXjbVjDCC7q2weIVSUYcPoIR4ycr6P1aoTwMI1ur78DFCdKNL3Uxv5L98LGD
	zVMawquuHyn67e069gYm3WDeUXIAIShfS1BWT/ciJ9v+QHrWv33oBqxTbHxVT9BYrVQjTm5Bt4SVl
	O4NPGF2/qb+NiPLRdH3HOmq5K+HgKl4yISGCTLONqtUw0TDxg6BdVivlrBXqvM2fYFmFcuy/b4kI3
	t2CLWolCTRo+NUw8XYFhNfSX1ZMrwknJzf1CUZ4Ao3peK8d1dHb06Mv/59RaL+GFwsohfdOz2YirN
	TL6//P2kM0d4zUqgC5Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12tq-00000000Jwz-2YXV;
	Fri, 13 Mar 2026 13:49:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12tn-00000000JwL-40A9
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:49:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D7JLmL237799
	for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AnC1JrbA1UMTynZ5YPu/FMu43Tob3eK136JnnQ/BVzU=; b=gwa5/QgNmnjGMtis
	1DLfyxp4IOGciKAHlnvjwVKArh/JmfSv2dzbFD9PsC9FOok6BxWUQQKm9nn3YqLF
	sgPI3FaOqQokp45U2VsAjcbRK5D8uIR/U6TVlzsilmdYg8iUGAIqsPO0at9ZoArs
	bFddhUpzFxBwFaDPrq2CP3ZgZBSbSyOE70pBsDW0txkXhTeFhratTt/MPA0cOLcn
	bcmUpbe/+jPeHXYhBNP42KsGooXPmEnO5XytciLNTRSebgXIE1mD5o20t1eTz4Ys
	Z5FGrCMokCA0rXX5wOEfIEhAUW852wp/oGmy0hBoZTTBDs0G2DTvKXxIJn+0drUI
	ywqqeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cve3d9bn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:49:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd773dd39bso1602201985a.2
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773409794; x=1774014594; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnC1JrbA1UMTynZ5YPu/FMu43Tob3eK136JnnQ/BVzU=;
        b=JTY97muySXmJ6HzqK+kfsGiwEbitD6HsbUM4De3/B3v1peGF0EeMkmreGKYMNIWg6z
         o0Kt1beGwmOQoR2XXOCaYpqb84hwfRwBslzyL8iUzDq9G8gRQ9tVV9j4NmONDgeJg0t9
         IuZXfoTd3hieY8pgbbm+yRUELsB7Ueslul9TlyaWbmt+F1p1FxtDStmRUXQ4YRnWsrSu
         2fDO4yV+W4OzZTf+IcLT6gniq2ampDrecYEEDUZK1FbcLgUZI1M8j90RBB8AGULS9q6h
         TEHElzTVHze5YG3e7HXrz3ybpqRtY/tlJ5TIktFVo38ZdUjFxRFDzb9qylOBU/bgYxPy
         zaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409794; x=1774014594;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AnC1JrbA1UMTynZ5YPu/FMu43Tob3eK136JnnQ/BVzU=;
        b=qxqPM1CXW3qdgpTcCa9A/50Vky2Dd4v6irzXKWJSaTPpfwqPnEHEnwgJTqmbI5XaU2
         xca+AjiNk2sdk8QJmX0bDSYXBmh7Wn5yjwwtins+dt4yAGFj9PQAodTPLI6kVqcVmiya
         vvstri1JUH6KyvOFqkyLgxgo94rR32IHnt4lt+HjYIvmSUudBds5kgIp4Ub4/tjDge4H
         RQiNf6HXaW7A5Q7adihlyLxNxOcWnhjUFL+FarE1WvImVFhyGJtwH8w4nMnONFTvGP08
         jIbbZdsaKX9gnj2LWgs9CQfhungu7Y4TuL1qNQN38VX4o8eYSouQTlJ4xukO03xG47Li
         jubA==
X-Forwarded-Encrypted: i=1; AJvYcCXNDxkniLpSnkzx8fbEZOYgtkOQc/tkl8+6+LGEYxFkmvELmaYAdNagQDB6BJVPLuXE92fjv9lLnkE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9i3l1jnl83Aq/zTrJabsEB7vS0JTp4OZZyY1Rdb05KK3Ql6+P
	HKZJJ5a376fhjiHK3qXjE8iFrmPcAqts64hudIfKU+llYlhjvecrmw+oFPNU8T1nzr953fPzsp+
	z6ycsSSNnCwG7r2momNbtzaPUwTW6r3XYgTqBleMTa7xaXU0Zcs0K5vjjD6wVAlC8NcSN
X-Gm-Gg: ATEYQzx4LTLgPDT4pTiK7nknnm3aD5hzUes3MqkJb46joMDeDab2tg67K0eTHusfHCi
	hp72o9DpGdFR7Qoy61vIbPwj8d8ZLaRecM7zeFLh9rXfwQf3ueynuinEB2J2H0UfGvJRLCUf3bp
	5K9AFj94+pdnJz6jInT2A7Hoeuls5aQD1nP3kaSDDgExLmGO6m56wZl6pcfdJCS0Ph55tWrIArF
	tWBpuIeu1VrvpqQHaz7tL72JUynmiFhjXdyIn4/3DPoGut91/ynBOsWqgqo5KAIVVQd49Pz9C9v
	B4zaBR5dADXq0HlxYMJ3NMpbVKus/PHqetGgIIqP54WmUDZFehank8rIaCHXNOxfHtwYNSdU6fR
	flkrTQN3DQ5IwGUyd+/lLIzlUnfyTXylkmd2DaZA1LyWXpARZ5qpZKOdnbtfm
X-Received: by 2002:a05:620a:5dd9:b0:8cd:b5f2:3b4e with SMTP id af79cd13be357-8cdb5f23b8bmr310879185a.44.1773409794207;
        Fri, 13 Mar 2026 06:49:54 -0700 (PDT)
X-Received: by 2002:a05:620a:5dd9:b0:8cd:b5f2:3b4e with SMTP id af79cd13be357-8cdb5f23b8bmr310876185a.44.1773409793700;
        Fri, 13 Mar 2026 06:49:53 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855778d268sm29514875e9.8.2026.03.13.06.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:49:52 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 13 Mar 2026 14:49:51 +0100
Message-Id: <DH1PAZDT90GE.2JU59DI89M0UD@oss.qualcomm.com>
Subject: Re: [PATCH 07/27] RISC-V: KVM: Add hideleg to struct
 kvm_vcpu_config
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
 <20260120080013.2153519-8-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-8-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -OiuX8PQ-UNXhd5vWJ6xKQzA5hKIHroi
X-Authority-Analysis: v=2.4 cv=FLwWBuos c=1 sm=1 tr=0 ts=69b41603 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=sIBLlZgNAvny2aHwhmQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExMCBTYWx0ZWRfX1Whl9543FPSP
 ZnptOV+e/7AuSFZ6HSSRP0dAsu2dmaWVmoxGbqn8lenMVX2xYlw5JglGeu9JeVInqD2gIg2QElf
 gYUKvwPIL0pK52It2dtkn6UN+995JerDEGwK7a498hnxpl5KiAr3LR0N/3Cc8qlBH8S/LB0In4s
 yHh44pRYVUI/Bs1imDDiZAF5mVj86phVownqSa5yJnUwJj/Q8jsAdldWX67KElVD8YWauZICxe3
 YDL20OJbt0xyTZ6KQWu88T0MpQNXtn2VjGoQiJ3/BRZt1N6vLU3hPqYY+lN0ZR2GK/gQyECr++z
 BL/vvQSdo0GzOErU2aZMC6T5ShG7jasQDzTurI7ySKti6kMS5ds1mUDdbf333Y7uMNbBwMPtv90
 SL4nlYpBFcCS2yePrPKabRrPqgMCxwB5sGx8/hTiZwIcknufs+WRSlJdWwH7JHzJVUO3eRWNwTn
 7TeWe2FyFDyB2MmbKjA==
X-Proofpoint-GUID: -OiuX8PQ-UNXhd5vWJ6xKQzA5hKIHroi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_064955_994816_A969A13C 
X-CRM114-Status: UNSURE (   9.16  )
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

MjAyNi0wMS0yMFQxMzoyOTo1MyswNTozMCwgQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVh
bGNvbW0uY29tPjoKPiBUaGUgaGlkZWxlZyBDU1Igc3RhdGUgd2hlbiBWQ1BVIGlzIHJ1bm5pbmcg
aW4gZ3Vlc3QgVlMvVlUtbW9kZSB3aWxsCj4gYmUgZGlmZmVyZW50IGZyb20gd2hlbiBpdCBpcyBy
dW5uaW5nIGluIGd1ZXN0IEhTLW1vZGUuIFRvIGFjaGlldmUKPiB0aGlzLCBhZGQgaGlkZWxlZyB0
byBzdHJ1Y3Qga3ZtX3ZjcHVfY29uZmlnIGFuZCByZS1wcm9ncmFtIGhpZGVsZWcKPiBDU1IgdXBv
biBldmVyeSBrdm1fYXJjaF92Y3B1X2xvYWQoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0
ZWwgPGFudXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KClJldmlld2VkLWJ5OiBSYWRp
bSBLcsSNbcOhxZkgPHJhZGltLmtyY21hckBvc3MucXVhbGNvbW0uY29tPgoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
